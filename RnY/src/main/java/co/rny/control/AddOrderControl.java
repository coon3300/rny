package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.OrderVO;

public class AddOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 문자 인코딩
		resp.setContentType("text/html; charset=UTF-8");

		// 서비스, VO 임포트
		OrderService osv = new OrderServiceImpl();
		OrderVO ovo = new OrderVO();
		CartVO cvo = new CartVO();
		
		// 장바구니에서 주문하기 버튼 -> 주문테이블 저장
		//osv.ordering(ovo);
		
		req.getRequestDispatcher("RnY/order.tiles") // tiles.xml "/WEB-INF/jsp/{1}.jsp"
		.forward(req, resp); // 페이지 재지정
	}

}
