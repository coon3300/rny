/**
 * 
 *//**
 * mainItemListService.js 
 * 목록, 등록, 삭제 기능을 정의.
 */

const svc = {
	// 목록.
	//replyList(bno=1, successCallback){
	itemListJson(param, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'itemListJson.do?lineNo=' + param);
		xhtp.send();
		xhtp.onload = loadCallback;
	} // end of replyList
}
 
 