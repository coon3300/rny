/*
 addreply.js
*/

document.addEventListener('DOMContentLoaded', function() {
	// 페이지가 로드되면 showPage() 함수를 호출
	showPage();

	// 댓글 등록 버튼 클릭 이벤트
	document.querySelector('#addReply').addEventListener('click', function() {
		if (responsibility !== 'admin') {
			alert('관리자만 댓글을 작성할 수 있습니다.');
			return;
		}

		let qno = document.querySelector('#qno').value;
		let content = document.querySelector('#content').value;
		let writer = document.querySelector('#writer').value;

		if (!writer || !content.trim()) {
			alert('로그인 후 댓글 작성이 가능합니다.');
			return;
		}

		let param = { qno, writer, content };
		console.log(param);

		svc.qnaReply(param, function() {
			let result = JSON.parse(this.responseText);
			console.log(result); // 서버 응답 데이터 확인
			if (result.retCode === 'Success') {
				alert("댓글이 등록되었습니다.");
				showPage(); // 댓글 등록 후 목록 갱신
			} else {
				alert('댓글 등록에 실패했습니다.');
			}
		});
	});
});

// 댓글 목록 출력 함수 정의
function showPage() {
	let qno = document.querySelector('#qno').value;
	console.log(qno);

	svc.replyList({ qno: qno }, function() {
		// 서버 응답 확인
		console.log(this.responseText);

		// 기존 목록 지우기
		let replyList = document.querySelector('#replyList');
		replyList.innerHTML = ''; // 전체 목록 초기화

		// 서버 데이터 확인 및 처리
		let result;
		try {
			result = JSON.parse(this.responseText);
			console.log(result); // 파싱된 결과 확인
		} catch (e) {
			console.error("JSON 파싱 오류:", e);
			alert('댓글 목록을 로드하는 중 오류가 발생했습니다.');
			return;
		}

		// 서버에서 받아온 결과를 기반으로 목록 생성
		result.forEach(reply => {
			replyList.appendChild(makeRow(reply));
		});
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
		let result = JSON.parse(this.responseText);
		if (result.retCode === 'Success') {
			alert('댓글이 삭제되었습니다.');
			document.querySelector('li[data-rno="' + rno + '"]').remove();
			showPage(); // 삭제 후 목록 갱신
		} else {
			alert('댓글 삭제에 실패했습니다.');
		}
	});
}