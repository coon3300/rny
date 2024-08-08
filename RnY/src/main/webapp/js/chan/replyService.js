/**
 * boardService
 * 목록,등록,삭제 기능을 정의
 */
const svc = {
	//목록.
	replyList(param = { qno }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'qnaList.do?qno=' + param.qno);
		xhtp.send();
		xhtp.onload = loadCallback
		//function 끝
	}, // replyList 끝 
	//등록.
	addReply(param = { qno, userNo, content }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'qnaReplyList.do?qno=' + param.qno + '&content=' + param.content + '&userNo=' + param.writer);
		xhtp.send();
		xhtp.onload = loadCallback
	}, //addReply 끝
}