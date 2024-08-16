package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;
import co.rny.vo.OrderVO;

public class OrderCheckControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터
				String cartNo = req.getParameter("cartNo");
				String userNo = req.getParameter("userNo");
				String orderNo = req.getParameter("orderNo");
				String orderName = req.getParameter("orderName");
				String orderAdd = req.getParameter("orderAdd");
				String orderPhone = req.getParameter("orderPhone");
				String orderEmail = req.getParameter("orderEmail");
				String orderMessage = req.getParameter("orderMessage");
				HttpSession session = req.getSession();
				String id = (String) session.getAttribute("logid");

				System.out.println(cartNo);
				System.out.println(orderName);
				
				OrderVO ovo = new OrderVO();
				ovo.setCartNo(cartNo);
				ovo.setUserNo(userNo);
				ovo.setOrderName(orderName);
				ovo.setOrderAdd(orderAdd);
				ovo.setOrderPhone(orderPhone);
				ovo.setOrderEmail(orderEmail);
				ovo.setOrderMessage(orderMessage);
				
				
				OrderService osv = new OrderServiceImpl();
				//osv.ordered(ovo);
				
				
				
				resp.sendRedirect("ordercheck.do");
		//req.getRequestDispatcher("RnY/ordercheck.tiles").forward(req, resp);
	}

}
