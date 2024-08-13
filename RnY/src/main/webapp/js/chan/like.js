/**
 reviewLike.js
*/
//좋아요 버튼에 클릭 이벤트 추가
document.addEventListener('DOMContentLoaded', function() {

	document.querySelectorAll('.addLike').forEach(function(span, index) {
		span.addEventListener('click', function() {

			let likeCountElement = document.querySelectorAll('.likeCount')[index];
			let count = parseInt(likeCountElement.textContent);
			count++;
			console.log(count);
			likeCountElement.textContent = count;
			let reviewNum = span.parentElement.querySelector('input').value;
			let url = "reviewLike.do?reviewNum=" + reviewNum;
			fetch(url) // promise객체. then(), catch()
				.then(function(result) {
					console.log(result);	// Response 객체.
					return result.json(); //json 문자열 형태로 반환.
				})
				.then(function(result) {
					console.log(result);
					if(result.retCode == "Success"){
						alert("좋아요 성공!");
					} else {
						alert("좋아요 실패!");
					}
				})
				.catch(function(err) {
					console.err(err);
				})
		});
	});
});
