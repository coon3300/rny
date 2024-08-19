package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class OrderCheckControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 요청 파라미터를 가져옵니다.
		String fullName = req.getParameter("send_fullName");
		String phone = req.getParameter("send_phone");
		String address = req.getParameter("send_address");
		String detailAddress = req.getParameter("send_detailAdress");
		String orderMemo = req.getParameter("send_orderMemo");
		String itemNos = req.getParameter("itemNos");
		String itemPrices = req.getParameter("itemPrices");
		String itemNames = req.getParameter("itemNames");
		String itemImages = req.getParameter("itemImages");
		String quantities = req.getParameter("quantities");
		String shippingCost = req.getParameter("shippingCost");
		String paymentMethod = req.getParameter("paymentMethod");
		System.out.println(orderMemo);
		
		OrderVO ovo = new OrderVO();
		OrderService osv = new OrderServiceImpl();
		
		
		
		// request에 값을 설정합니다.
		req.setAttribute("fullName", fullName);
		req.setAttribute("phone", phone);
		req.setAttribute("address", address);
		req.setAttribute("detailAddress", detailAddress);
		req.setAttribute("orderMemo", orderMemo);
		req.setAttribute("itemNos", itemNos);
		req.setAttribute("itemPrices", itemPrices);
		req.setAttribute("itemNames", itemNames);
		req.setAttribute("itemImages", itemImages);
		req.setAttribute("quantities", quantities);
		req.setAttribute("shippingCost", shippingCost);
		req.setAttribute("paymentMethod", paymentMethod);

		// orderCheck.tiles로 포워딩합니다.
		req.getRequestDispatcher("RnY/orderCheck.tiles").forward(req, resp);

	}

}
