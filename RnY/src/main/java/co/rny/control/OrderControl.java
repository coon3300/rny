package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action == null) {
			action = "viewCart"; // 기본적으로 장바구니 보기로 설정
		}

		OrderService osv = new OrderServiceImpl();

		// 요청 파라미터 추출

		String itemNos = req.getParameter("itemNos");

		String itemPrices = req.getParameter("itemPrices");
		String quantities = req.getParameter("quantities");

		String totalAmount = req.getParameter("totalAmount");
		String userId = req.getParameter("userId");
		boolean paymentSuccess = false;
		OrderVO ovo = new OrderVO();
		ovo.setOrderPrice(Integer.parseInt(totalAmount));
		ovo.setUserId(userId);
		osv.addOrder(ovo);
		if (osv.addOrder(ovo) == 1) {

			String[] itemNoArray = itemNos.split("/");
			String[] itemPriceArray = itemPrices.split("/");
			String[] quantityArray = quantities.split("/");

			// Loop through the product numbers
			for (int i = 0; i < itemNoArray.length; i++) {
				ovo = new OrderVO();
				ovo.setItemNo(Integer.parseInt(itemNoArray[i]));
				ovo.setOdPrice(Integer.parseInt(itemPriceArray[i]));
				ovo.setOdCnt(Integer.parseInt(quantityArray[i]));

				if (osv.addOrderDetail(ovo) == 1) {

					paymentSuccess = true;
				} else {
					paymentSuccess = false;

				}
			}
		}

		/*
		 * // 결과 메시지 설정 String status = paymentSuccess ? "success" : "error"; String
		 * message = paymentSuccess ? "결제가 완료되었습니다." : "결제에 실패했습니다.";
		 * 
		 * // 요청 속성에 상태와 메시지 설정 req.setAttribute("status", status);
		 * req.setAttribute("message", message);
		 * 
		 * // 결과 페이지로 포워딩 if (paymentSuccess) {
		 * req.getRequestDispatcher("RnY/orderComplete.tiles").forward(req, resp);
		 * return; // 포워딩 후 메서드 종료 } else {
		 * req.getRequestDispatcher("RnY/error.tiles").forward(req, resp); return; //
		 * 포워딩 후 메서드 종료 }
		 */

	}

}
