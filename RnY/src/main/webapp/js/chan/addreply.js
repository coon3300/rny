/**
 board.js
*/
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

	svc.qnaReply(param, function() {
		// 등록완료 => 화면에 등록된 글 추가
		let result = JSON.parse(this.responseText);
		if (result.retCode == 'Success') {
			alert("댓글이 등록되었습니다.")
			showPage();
		}
	});
});
// 댓글목록 출력

showPage();
function showPage() {
	svc.replyList({ qno }, function() {
		//기존 목록을 지우기.
		replyList.querySelectorAll('li').forEach((li, idx) => {
			if (idx != 0) {
				li.remove();
			}
		})
		//페이지 로드 하면서 목록을 출력
		let result = JSON.parse(this.responseText);

		result.forEach(reply => {
			qreplyList.appendChild(makeRow(reply));
		});// 데이터 5개 그려주는 영역
		// 실제 데이터값으로 페이지 출력
		svc.pagingCount(qno, createPageList);
	});//페이징을 그려주는 영역
}
// reply => row 생성
function makeRow(reply = {}) { // reply = {} 객체타입 표시
	let cloned = document.querySelector('div.reply>div.content li').cloneNode(true);
	cloned.setAttribute('data-rno', reply.qreplynum)
	cloned.style.display = 'block'; // <li style={}></li>
	cloned.querySelector('span:nth-of-type(1)').innerText = reply.qreplynum;
	cloned.querySelector('span:nth-of-type(2)').innerText = reply.qreplyContent;
	cloned.querySelector('span:nth-of-type(3)').innerText = reply.userNo;

	return cloned;
}
