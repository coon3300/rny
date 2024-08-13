package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.WishVO;

public class WishControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");

		// parameter
		MemberService svc = new MemberServiceImpl();
		WishService wvc = new WishServiceImpl();

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logid");
//		String wno = req.getParameter("wishNo");

		// resp.sendRedirect("main.do");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		if (id == null) {
			out.println("<script language='javascript'>");
			out.println("alert('위시리스트는 로그인 후 사용가능합니다!')");
			out.println("location.href='main.do';");
			out.println("</script>");
			return;
		}

		// 세션객체(attribute)
		WishService wsv = new WishServiceImpl();
		List<WishVO> wishlist = wsv.wishheart(id);
		// 찜삭제
		req.setAttribute("logWish", wishlist);

		req.getRequestDispatcher("RnY/wish.tiles").forward(req, resp);

	}
}
