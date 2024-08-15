/**
 * mainItemList.js
 */


function getMainItemList(param) {

	svc.itemListJson(param, function() {

		let result = JSON.parse(this.responseText);
		
		//console.log(result);

		document.getElementById('mainItemDiv').innerHTML = "";
		
		result.forEach(item => {
			makeRow(item);
		});
		
	});
}

function makeRow(item = {}) {
	let mainDiv = document.createElement('div');
	//                 <div class="item cat col-md-4 col-lg-3 my-4" id="mainItem">

  mainDiv.setAttribute('class', 'item cat col-md-4 col-lg-3 my-4');

  mainDiv.innerHTML = `
    <!--<div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
    New
    </div>
    -->
    <div class="card position-relative">
      <a href="itemInfo.do?itemNo=${item.itemNo}"><img src="images/line/${item.lineNo}a.jpg" class="img-fluid rounded-4" alt="image"></a>
      <div class="card-body p-0">
        <a href="#"><h3 class="card-title pt-4 m-0">${item.itemName}</h3></a>
        <div class="card-text">
          <span class="rating secondary-font">
            <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
            ${item.itemNo * 7 % 5 + 1}
          </span>
          <h3 class="secondary-font text-primary">${item.itemPrice.toLocaleString('ko-KR')}원</h3>
          <div class="d-flex flex-wrap mt-3">
            <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
              <h5 class="text-uppercase m-0">장바구니 담기</h5>
            </a>
            <a href="#" class="btn-wishlist px-4 pt-3">
              <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
            </a>
          </div>
        </div>
      </div>
    </div>
  `;
	document.getElementById('mainItemDiv').appendChild(mainDiv);
}