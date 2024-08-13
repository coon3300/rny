/**
 * boardService
 * 목록,등록,삭제 기능을 정의
 */
const svc = {
	//목록
	replyList(param = { qno }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'qnaReplyList.do?qno=' + param.qno);
		xhtp.send();
		xhtp.onload = loadCallback
		//function 끝
	}, // replyList 끝 
	//등록
	qnaReply(param = { qno, writer, content }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'qnaReply.do?qno=' + param.qno + '&content=' + param.content + '&userId=' + param.writer);
		xhtp.send();
		xhtp.onload = loadCallback
	}, //addReply 끝
	//삭제
	delReply(qno = 1, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'deleteReply.do?dno=' + qno);
		xhtp.send();
		xhtp.onload = loadCallback
},
}// svc 끝