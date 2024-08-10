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
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;
import co.rny.vo.OrderVO;
import co.rny.vo.WishListVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// parameter
		OrderService ovc = new OrderServiceImpl();
		String id = req.getParameter("id");
				
		// 세션객체(attribute)
		HttpSession session = req.getSession();
		
		
		List<OrderVO> list = ovc.orderList();
		req.setAttribute("orderList", list);
		
		MemberVO mvo = new MemberVO();
		req.setAttribute("mvo", mvo);
		ItemVO ivo = new ItemVO();
		req.setAttribute("ivo", ivo);
		OrderVO ovo = new OrderVO();
		req.setAttribute("ovo", ovo);
		
		req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);
	}
	

}
