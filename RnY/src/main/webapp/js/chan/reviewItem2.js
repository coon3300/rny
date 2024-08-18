/**
 reviewItem.js
*/

console.log('reviewItem.js' + itemNo);
let reviewItemList = document.querySelector('#reviewItemList');
let page = 1; // 아래쪽에서 댓글의 페이지를 지정(현재페이지를 받아놓는 변수)

// 댓글 등록 버튼에 클릭이벤트 등록
//document.querySelector('#addReply').addEventListener('click', function() {
document.querySelector('#addReview').addEventListener('click', function() {
	let itemNo = document.querySelector('#itemNo').value;
	let content = document.querySelector('#content').value;
	let userId = document.querySelector('#userId').value;
	//if (!replyer || !content) {
	if (!userId || !content) {
		alert('로그인 정보를 확인하세요');
		return;
	}
	//let parm = { bno, replyer, content }
	let param = { itemNo, userId, content }

	//svc.addReply(param, function() {
	svc.addReview(param, function() {
		// 등록완료 => 화면에 등록된 글 추가
		let result = JSON.parse(this.responseText);
		console.log(result);
		if (result.retCode == 'Success') {
			alert("리뷰 작성이 완료되었습니다.")
			//replyList.appendChild(makeRow(result.retVal));
			page = 1;
			showPage();
		}
	});
});
// 댓글목록 출력
showPage();
function showPage() {
	//svc.replyList({ bno, page }, function() {
	let itemNo = document.querySelector('#itemNo').value;
	svc.reviewItemList({ itemNo, page }, function() {
		//기존 목록을 지우기.
		//replyList.querySelectorAll('li').forEach((li, idx) => {
		reviewItemList.querySelectorAll('li').forEach((li, idx) => {
			if (idx != 0) {
				li.remove();
			}
		})
		//페이지 로드 하면서 목록을 출력
		let result = JSON.parse(this.responseText);
		//result.forEach(reply => {
		result.forEach(review => {
			//replyList.appendChild(makeRow(reply));
			reviewItemList.appendChild(makeRow(review));
		});// 데이터 5개 그려주는 영역
		// 실제 데이터값으로 페이지 출력
		svc.pagingCount(itemNo, createPageList);
	});//페이징을 그려주는 영역
}


// reply => row 생성
//function makeRow(reply = {}) { // reply = {} 객체타입 표시
function makeRow(review = {}) { // reply = {} 객체타입 표시
	//let cloned = document.querySelector('div.reply>div.content li').cloneNode(true);
	let cloned = document.querySelector('#reviewItemList li').cloneNode(true);
	//cloned.setAttribute('data-rno', reply.replyNo)
	//cloned.querySelector('span:nth-of-type(1)').innerText = reply.replyNo;
	//cloned.querySelector('span:nth-of-type(2)').innerText = reply.replyContent;
	//cloned.querySelector('span:nth-of-type(3)').innerText = reply.replyer;
	//cloned.setAttribute('data-rno', review.reviewNum)
	cloned.style.display = 'block'; // <li style={}></li>
	cloned.setAttribute('data-rno', review.reviewNum)
	cloned.querySelector('span:nth-of-type(1)').innerText = review.reviewNum;
	cloned.querySelector('span:nth-of-type(2)').innerText = review.reviewContent;
	cloned.querySelector('span:nth-of-type(3)').innerText = review.userId;
	cloned.querySelector('span:nth-of-type(4)').innerText = review.reviewDate;
	cloned.querySelector('button').addEventListener('click', RemoveReviewFnc)
	return cloned;
}

// 댓글 삭제 이벤트 핸들러
function RemoveReviewFnc(e) {
	let rno = e.target.parentElement.parentElement.dataset.rno;
	svc.delReview(rno, function(e) {
		let result = JSON.parse(this.responseText);
		if (result.retCode == 'Success') {
			alert('!!! 삭제 성공 !!!')
			//document.querySelector('li[data-rno="' + rno + '"]').remove();
			showPage();
		} else {
			alert('!!! 삭제 실패 !!!')
		}
	})
}

// 페이지 a태그 생성
function createPageList(event) {
	let result = JSON.parse(this.responseText);
	let totalCnt = result.totalCount;
	// page = 11;
	let startPage, endPage; // 현재페이지를 기준으로 계산한 첫 페이지 번호 ~ 마지막 페이지 번호
	let next, prev; // 이전, 이후 페이지를 체크하는 변수
	let realEnd = Math.ceil(totalCnt / 5); // 실제 마지막 페이지

	endPage = Math.ceil(page / 10) * 10;
	startPage = endPage - 9;
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1; // 이전 10개의 페이지 존재를 구분
	next = endPage < realEnd ? true : false;

	//document.querySelector('ul.pagination').innerHTML = ''; // 기존 html 지우기


	// 이전 10페이지 여부.
	let li = document.createElement('li');
	li.className = 'page-item'; // class='page-item active'
	// 이전페이지의 존재 구분
	if (prev) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', startPage - 1);
		aTag.className = 'page-link';
		aTag.href = '#';
		aTag.innerHTML = 'Previous';
		li.appendChild(aTag);
	} else {
		li.classList.add('disabled'); // li요소의 클래스 추가
		console.log(li)
		let span = document.createElement('span');
		span.className = 'page-link';
		span.innerHTML = 'Previous';
		li.appendChild(span);
	}
	document.querySelector('ul.pagination').appendChild(li);


	// 10개 출력.<li class="page-item"><a class="page-link" href="#">3</a></li>
	for (let p = startPage; p <= endPage; p++) {
		let li = document.createElement('li');
		li.className = 'page-item'; // class='page-item active'
		if (page == p) {
			li.classList.add('active');
			let span = document.createElement('span');
			span.className = 'page-link';
			span.innerHTML = p;
			li.appendChild(span);

		} else {
			let aTag = document.createElement('a');
			aTag.setAttribute('data-page', p);
			aTag.className = 'page-link';
			aTag.href = '#';
			aTag.innerHTML = p;
			li.appendChild(aTag);
		}
		document.querySelector('ul.pagination').appendChild(li);
	} // end do for

	// 이후 몇개의 페이지가 있는지
	li = document.createElement('li');
	li.className = 'page-item'; // class='page-item active'
	if (next) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', endPage + 1);
		aTag.className = 'page-link';
		aTag.href = '#';
		aTag.innerHTML = 'next';
		li.appendChild(aTag);
	} else {
		li.classList.add('disabled');//li태그의 스타일을 비활성화
		let span = document.createElement('span');
		span.className = 'page-link';
		span.innerHTML = 'next';
		li.appendChild(span);
	}
	document.querySelector('ul.pagination').appendChild(li);

	// a태그의 이벤트 틍록
	pageMove();
} // end of createPageList


// paging영역의 a 태그를 클릭하면....
function pageMove() {

	//document.querySelectorAll('div.reply ul.pagination a')//
	document.querySelectorAll('div.review ul.pagination a')//
		.forEach(item => {
			//a태그에 클릭 이벤트 등록
			item.addEventListener('click', function(e) {
				page = item.dataset.page;//previous, Next
				//service에서 목록을 출력하는 메소드 호출
				//svc.replyList({ bno, page }, function(e) {
				let itemNo = document.querySelector('#itemNo').value;
				svc.reviewItemList({ itemNo, page }, function(e) {
					// 기존목록을 삭제.
					reviewItemList.querySelectorAll('li').forEach((li, idx) => {
						if (idx != 0) {
							li.remove();
						}
					})// 이전에 있던 목록을 삭제
					let result = JSON.parse(this.response);
					result.forEach(review => {
						reviewItemList.appendChild(makeRow(review));
					});
					//페이지 새로 출력
					svc.pagingCount(itemNo, createPageList);
				}); //end of svc.reviewItemList
			})//click event.
		});
} // end of pageMove
