/**
 board.js
*/
let page = 1;
// 댓글 등록 버튼에 클릭이벤트 등록
document.querySelector('#addReply').addEventListener('click', function() {
	let qno = document.querySelector('#qno').value;
	let content = document.querySelector('#content').value;
	let writer = document.querySelector('#writer').value;
	if (!writer || !content) {
		alert('로그인 후 댓글 작성이 가능합니다.');
		return;

	}
	let param = { qno, writer, content }
	console.log(param);
	svc.qnaReply(param, function() {
		// 등록완료 => 화면에 등록된 글 추가
		let result = JSON.parse(this.responseText);
		console.log(result);
		if (result.retCode == 'Success') {
			alert("댓글이 등록되었습니다.")
			page = 1;
			showPage();
		}
	});
});
// 댓글목록 출력

showPage();
function showPage() {
	let qn = qno.value
	console.log(qn);
	svc.replyList({ qno: qn }, function() {
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
	});
}
// reply => row 생성
function makeRow(reply = {}) { // reply = {} 객체타입 표시
	let cloned = document.querySelector('#replyList>li').cloneNode(true);
	cloned.setAttribute('data-rno', reply.qreplyNum)
	cloned.style.display = 'block'; // <li style={}></li>
	cloned.querySelector('span:nth-of-type(1)').innerText = reply.qreplyNum;
	cloned.querySelector('span:nth-of-type(2)').innerText = reply.userId;
	cloned.querySelector('span:nth-of-type(3)').innerText = reply.qreplyContent;
	cloned.querySelector('span:nth-of-type(4)').innerText = reply.qreplyDate;
	cloned.querySelector('button').addEventListener('click', RemoveReplyFnc)
	return cloned;
}


// 댓글 삭제 이벤트 핸들러
function RemoveReplyFnc(e) {

	let rno = e.target.closest('li').dataset.rno;
	console.log(rno);
	svc.delReply(rno, function(e) {
		let result = JSON.parse(this.responseText);
		if (result.retCode == 'Success') {
			alert('삭제 성공')
			document.querySelector('li[data-rno="' + rno + '"]').remove();
			showPage();
		} else {
			alert('삭제 실패')
		}
	})
}