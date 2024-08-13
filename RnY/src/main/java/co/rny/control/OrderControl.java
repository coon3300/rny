package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
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
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.CartVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// parameter
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logid");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		//resp.sendRedirect("main.do");
		if (id == null) {
			out.println("<script language='javascript'>");
			out.println("alert('주문은 로그인 후 사용가능합니다!')");
			out.println("location.href='main.do';");
			out.println("</script>");
			return;
		}

		MemberService svc = new MemberServiceImpl();
		// 세션객체(attribute)
		OrderService ovc = new OrderServiceImpl();
		// List<OrderVO> list = ovc.listOrder(id);
		CartService csv = new CartServiceImpl();
		List<CartVO> cartlist = csv.cartList(id);

		// req.setAttribute("orderList", list);
		req.setAttribute("logCart", cartlist);
		// req.setAttribute("logOrder", list);
		// req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);

		req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);

	}

}
