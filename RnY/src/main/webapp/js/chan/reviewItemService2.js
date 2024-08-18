/**
 * reviewItemService
 * 목록,등록,삭제 기능을 정의
 */

 const svc = {
	//목록.
	//replyList(param = { bno, page }, loadCallback) {
	reviewItemList(param = { itemNo, page }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'reviewItemList.do?itemNo=' + param.itemNo + '&page=' + param.page);
		xhtp.send();
		xhtp.onload = loadCallback
		//function 끝
	}, // reviewItemList 끝 
	//등록.
	//addReply(param = { bno, replyer, content }, loadCallback) {
	addReview(param = { itemNo, userId, content, reviewDate }, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'addReview.do?itemNo=' + param.itemNo + '&content=' + param.content + '&userId=' + param.userId + '&reviewDate=' + param.reviewDate );
		xhtp.send();
		xhtp.onload = loadCallback
	}, //addReview 끝
	//삭제
	//delReply(rno = 1, loadCallback) {
	delReview(rno = 1, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'removeReply.do?rvo=' + rno);
		xhtp.send();
		xhtp.onload = loadCallback

	},
	//댓글 갯수
	//pagingCount(bno = 1, loadCallback) {
	pagingCount(itemNo = 1, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'pagingCount.do?rno=' + itemNo);
		xhtp.send();
		xhtp.onload = loadCallback;

	}

} // svc 끝