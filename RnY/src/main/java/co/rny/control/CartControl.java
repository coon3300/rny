package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public class CartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");

		// parameter
		MemberService svc = new MemberServiceImpl();

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logid");

		// 세션객체(attribute)
		CartService csv = new CartServiceImpl();
		List<CartVO> cartlist = csv.cartList(id);
		// 찜삭제
		req.setAttribute("logCart", cartlist);

		req.getRequestDispatcher("RnY/cart.tiles").forward(req, resp);
	}

}
