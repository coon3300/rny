package co.rny.control;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.CartListService;
import co.rny.service.CartListServiceImpl;
import co.rny.vo.CartListVO;

public class CartListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 사용자 ID를 세션에서 가져오기
		HttpSession session = req.getSession();
		String userId = req.getParameter("userId");
		String userNo = (String)session.getAttribute("userNo");
		
		// req.getParameterValues("pcode");
		System.out.println(userNo);
		
		CartListService csc = new CartListServiceImpl();

		// 사용자 ID가 null이면 빈 리스트를 반환하고, 그렇지 않으면 장바구니 목록을 가져오기
		List<CartListVO> cartList = userNo != null ? csc.getCartList(userNo) : Collections.emptyList();

		// 요청 속성에 장바구니 목록 저장
		req.setAttribute("cartList", cartList);
		// req.setAttribute("pcode");

		// JSP 페이지로 포워딩
		req.getRequestDispatcher("RnY/cartList.tiles").forward(req, resp);

	}

}
