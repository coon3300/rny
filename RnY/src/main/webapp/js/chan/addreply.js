// 전역 범위에서 responsibility 선언
let responsibility = "<%= session.getAttribute('responsibility') != null ? session.getAttribute('responsibility') : '' %>";

document.addEventListener('DOMContentLoaded', function() {
	console.log("JavaScript에서 확인된 responsibility 값:", responsibility);

	// responsibility 값이 null이거나 빈 문자열일 경우 처리
	if (!responsibility) {
		console.error("responsibility 값이 null 또는 빈 문자열입니다. 로그인 상태를 확인하세요.");
		alert("로그인 정보가 없습니다. 다시 로그인 해주세요.");
		return; // 더 이상 진행하지 않음
	}

	// 댓글 등록 버튼 이벤트
	document.querySelector('#addReply').addEventListener('click', function() {
		if (responsibility !== 'admin') {
			alert('관리자만 댓글을 작성할 수 있습니다.');
			return;
		}

		let qno = document.querySelector('#qno').value;
		let content = document.querySelector('#content').value.trim();
		let writer = document.querySelector('#writer').value;

		if (!writer || !content) {
			alert('로그인 후 댓글 작성이 가능합니다.');
			return;
		}

		let param = { qno, writer, content };
		console.log('댓글 등록 요청 데이터:', param);

		svc.qnaReply(param, function() {
			try {
				let result = JSON.parse(this.responseText);
				console.log('서버 응답:', result); // 서버 응답 데이터 확인
				if (result.retCode === 'Success') {
					alert("댓글이 등록되었습니다.");
					showPage(); // 댓글 등록 후 목록 갱신
				} else {
					console.error('댓글 등록 실패:', result);
					alert('댓글 등록에 실패했습니다.');
				}
			} catch (e) {
				console.error("응답 처리 중 오류 발생:", e);
				alert('서버 응답을 처리하는 중 오류가 발생했습니다.');
			}
		});
	});

	showPage();
});

function showPage() {
	let qno = document.querySelector('#qno').value;
	console.log('QNA 번호:', qno);

	svc.replyList({ qno: qno }, function() {
		try {
			let result = JSON.parse(this.responseText);
			console.log('댓글 목록:', result); // 파싱된 결과 확인

			// 기존 목록 지우기
			let replyList = document.querySelector('#replyList');
			replyList.innerHTML = ''; // 전체 목록 초기화

			// 서버에서 받아온 결과를 기반으로 목록 생성
			if (result.length > 0) {
				result.forEach(reply => {
					replyList.appendChild(makeRow(reply));
				});
			} else {
				console.log('표시할 댓글이 없습니다.');
			}
		} catch (e) {
			console.error("JSON 파싱 오류:", e);
			alert('댓글 목록을 로드하는 중 오류가 발생했습니다.');
		}
	});
}

// 년월일 포맷으로 출력하는 메소드
Date.prototype.yyyymmdd = function() {
	let yyyy = this.getFullYear();
	let MM = this.getMonth() + 1;
	let dd = this.getDate();

	return yyyy + "-" + ('0' + MM).slice(-2) + "-" + ('0' + dd).slice(-2);
};

// reply => row 생성
function makeRow(reply = {}) {
	console.log(new Date(reply.qreplyDate));

	// 템플릿 li 요소 생성
	let cloned = document.createElement('li');
	cloned.setAttribute('data-rno', reply.qreplyNum);
	cloned.innerHTML = `
        <span class="col-sm-11">${reply.qreplyNum}</span>
        <span class="col-sm-5">${reply.qreplyContent}</span>
        <span class="col-sm-11">${reply.userId}</span>
        <span class="col-sm-11">${new Date(reply.qreplyDate).yyyymmdd()}</span>
        ${responsibility === 'admin' ? '<button type="button" class="btn btn-outline-info">삭제</button>' : ''}
    `;

	// 삭제 버튼 이벤트 추가 (관리자만)
	const deleteButton = cloned.querySelector('button');
	if (deleteButton) {
		deleteButton.addEventListener('click', RemoveReplyFnc);
	}

	return cloned;
}

// 댓글 삭제 이벤트 핸들러
function RemoveReplyFnc(e) {
	let rno = e.target.closest('li').dataset.rno;
	console.log(rno);

	svc.delReply(rno, function() {
		try {
			let result = JSON.parse(this.responseText);
			if (result.retCode === 'Success') {
				alert('댓글이 삭제되었습니다.');
				document.querySelector('li[data-rno="' + rno + '"]').remove();
				showPage(); // 삭제 후 목록 갱신
			} else {
				alert('댓글 삭제에 실패했습니다.');
			}
		} catch (e) {
			console.error("응답 처리 중 오류 발생:", e);
			alert('서버 응답을 처리하는 중 오류가 발생했습니다.');
		}
	});
}
