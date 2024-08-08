/**
 board.js
*/
// 댓글 등록 버튼에 클릭이벤트 등록
document.querySelector('#addReply').addEventListener('click', function() {
	let content = document.querySelector('#content').value;
	if (!replyer || !content) {
		alert('필수입력항목');
		return;
	}
	let parm = { qno, writer, content }

	svc.addReply(parm, function() {
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