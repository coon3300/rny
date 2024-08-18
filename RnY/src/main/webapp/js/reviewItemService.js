/**
 * reviewItemService.js
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
    
    
    
    addReview(param = { itemNo, userId, reviewContent, reviewImage }, loadCallback) {
    const formData = new FormData();
    formData.append('itemNo', param.itemNo);
    formData.append('userId', param.userId);
    formData.append('reviewContent', param.reviewContent);
    
    if (param.reviewImage) {
      formData.append('reviewImage', param.reviewImage);
    }

    const xhtp = new XMLHttpRequest();
    xhtp.open('POST', 'reviewAddFile.do');
    xhtp.onload = loadCallback;
    xhtp.send(formData);
  },
    
    
    /*
    //등록.
    //addReply(param = { bno, replyer, content }, loadCallback) {
    addReview(param = { itemNo, userId, reviewContent }, loadCallback) {
        const xhtp = new XMLHttpRequest();
        xhtp.open('get', 'reviewAdd.do?itemNo=' + param.itemNo + '&reviewContent=' + param.reviewContent + '&userId=' + param.userId);
        xhtp.send();
        xhtp.onload = loadCallback
    }, //addReview 끝
    */
	 
    //삭제
    //delReply(rno = 1, loadCallback) {
    delReview(reviewNum = 1, loadCallback) {
        const xhtp = new XMLHttpRequest();
        xhtp.open('get', 'reviewRemove.do?reviewNum=' + reviewNum);
        xhtp.send();
        xhtp.onload = loadCallback

    },
    //댓글 갯수
    //pagingCount(bno = 1, loadCallback) {
    pagingCount(itemNo = 1, loadCallback) {
        const xhtp = new XMLHttpRequest();
        xhtp.open('get', 'reviewPagingCount.do?itemNo=' + itemNo);
        xhtp.send();
        xhtp.onload = loadCallback;

    }

} // svc 끝