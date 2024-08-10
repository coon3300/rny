package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.MemberVO;
import co.rny.vo.OrderVO;
import co.rny.vo.WishListVO;
import co.rny.vo.WishVO;

public class loginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mem = svc.loginCheck(id, pw);
		
		
		// ***예림***
		String nick  = svc.userNick(id); 
		WishService wsv = new WishServiceImpl();
//		List<WishListVO> list = wsv.wishItem(id);
//		List<WishVO> wishlist = wsv.wishheart(id);
		OrderService osv = new OrderServiceImpl();
		List<OrderVO> orderlist = osv.ordering(id);
		// ***예림***
		
		
		
		if (mem == null) {
			req.setAttribute("msg", "아이디와 비번 확인하세요");
			req.getRequestDispatcher("member/loginForm.tiles") 
					.forward(req, resp);
			return;
		}
		
		
		// 세션객체(attribute)
		HttpSession session = req.getSession();
		session.setAttribute("logid", id);
		session.setMaxInactiveInterval(30 * 60);
		// ***예림***
		session.setAttribute("logNick", nick);
//		session.setAttribute("itemWish", list);
//		session.setAttribute("logWish", wishlist);
		session.setAttribute("order", orderlist);
		// !
		
		
		
		if (mem.getResponsibility().equals("user")) {
			resp.sendRedirect("main.do");
		} else if (mem.getResponsibility().equals("Admin")) {
			resp.sendRedirect("memberList.do");
		} else {
			System.out.println("권한을 지정하세요");
		}
		
		
		

	}

}
