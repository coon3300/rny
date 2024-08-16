/**
 * replyService
 * 목록,등록,삭제 기능을 정의
 */
const svc = {
	//목록
	replyList(param = { qno }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('GET', `qnaReplyList.do?qno=${encodeURIComponent(param.qno)}`);
		xhtp.send();
		xhtp.onload = loadCallback;
	},
	//등록
	qnaReply(param = { qno, writer, content }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('GET', `qnaReply.do?qno=${encodeURIComponent(param.qno)}&content=${encodeURIComponent(param.content)}&userId=${encodeURIComponent(param.writer)}`);
		xhtp.send();
		xhtp.onload = loadCallback;
	},
	//삭제
	delReply(rno = 1, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('GET', `deleteReply.do?rno=${encodeURIComponent(rno)}`);
		xhtp.send();
		xhtp.onload = loadCallback;
	},
};