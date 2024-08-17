/**
 reviewLike.js
*/
// 좋아요 버튼에 클릭 이벤트 추가

document.addEventListener('DOMContentLoaded', function() {

	document.querySelectorAll('.addLike').forEach(function(span, index) {
		span.addEventListener('click', function() {
			// 이미 클릭된 경우 중복 클릭 방지
			if (span.classList.contains('liked')) {
				alert("이미 좋아요를 눌렀습니다.");
				return;
			}

			let likeCountElement = document.querySelectorAll('.likeCount')[index];
			let count = parseInt(likeCountElement.textContent);
			count++;
			console.log(count);
			likeCountElement.textContent = count;
			let reviewNum = span.parentElement.querySelector('input').value;
			let url = "reviewLike.do?reviewNum=" + reviewNum;

			fetch(url) // promise 객체. then(), catch()
				.then(function(result) {
					console.log(result); // Response 객체.
					return result.json(); // json 문자열 형태로 반환.
				})
				.then(function(result) {
					console.log(result);
					if (result.retCode == "Success") {
						alert("좋아요 성공!");
						//중복 방지
						span.classList.add('liked');
					} else {
						alert("좋아요 실패!");
						// 좋아요 실패 시 카운트 복구
						likeCountElement.textContent = count - 1;
					}
				})
				.catch(function(err) {
					console.error(err);
					// 에러 발생 시 카운트 복구
					likeCountElement.textContent = count - 1;
				});
		});
	});
});
