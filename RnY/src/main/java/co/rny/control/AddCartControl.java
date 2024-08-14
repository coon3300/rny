package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터
		String userNo = req.getParameter("userNo");
		String itemNo = req.getParameter("itemNo");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logid");

		CartService csv = new CartServiceImpl();

		ItemVO ivo = new ItemVO();
		MemberVO mvo = new MemberVO();
		mvo.setItemNo(Integer.parseInt(itemNo));
		mvo.setUserNo(userNo);

		// wsv.addWish(ivo, mvo);
		// wsv.addWish(userNo, Integer.parseInt(itemNo));
		csv.addCart(mvo);

		resp.sendRedirect("cart.do");
	}

}
