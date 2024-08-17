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

		svc.addReply(param, function() {
			// 등록완료 => 화면에 등록된 글 추가
			let result = JSON.parse(this.responseText);
			console.log(result);
			if (result.retCode == 'Success') {
				alert("성공!!")
				//replyList.appendChild(makeRow(result.retVal));
				page = 1;
				showPage();
			}
		});
	});

	// 댓글목록 출력
	showPage();
	function showPage() {
		svc.replyList({ qno, page }, function() {
			//기존 목록을 지우기.
			replyList.querySelectorAll('li').forEach((li, idx) => {
				if (idx != 0) {
					li.remove();
				}
			})
			//페이지 로드 하면서 목록을 출력
			let result = JSON.parse(this.responseText);
			result.forEach(reply => {
				replyList.appendChild(makeRow(reply));
			});// 데이터 5개 그려주는 영역
			// 실제 데이터값으로 페이지 출력
			svc.pagingCount(qno, createPageList);
		});//페이징을 그려주는 영역
	}


	// 년월일 포맷으로 출력하는 메소드
	Date.prototype.yyyymmdd = function() {
		let yyyy = this.getFullYear();
		let MM = this.getMonth() + 1;
		let dd = this.getDate();

		return yyyy + "-" + ('0' + MM).slice(-2) + "-" + ('0' + dd).slice(-2);
	};

	// reply => row 생성
	function makeRow(reply = {}) { // reply = {} 객체타입 표시
		let cloned = document.querySelector('div.reply>div.content li').cloneNode(true);
		cloned.setAttribute('data-rno', reply.qreplyNum)
		cloned.style.display = 'block'; // <li style={}></li>
		cloned.querySelector('span:nth-of-type(1)').innerText = reply.qreplyNum;
		cloned.querySelector('span:nth-of-type(2)').innerText = reply.qreplyContent;
		cloned.querySelector('span:nth-of-type(3)').innerText = reply.userId;
		cloned.querySelector('span:nth-of-type(3)').innerText = reply.qreplyDate;
		cloned.querySelector('button').addEventListener('click', RemoveReplyFnc)
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
})