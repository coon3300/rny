package co.rny.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class CheckControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logid");
		String userNo = req.getParameter("userNo");
		String orderDate = req.getParameter("orderDate");
		
		
		req.setCharacterEncoding("utf-8");
		OrderService osv = new OrderServiceImpl();
		OrderVO ovo = new OrderVO();
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		try {
//			ovo.setOrderDate(sdf.parse(orderDate));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		List<OrderVO> orderlist = osv.getOrderList(userNo);
		req.setAttribute("orderList", orderlist);
		
		req.getRequestDispatcher("RnY/check.tiles").forward(req, resp);
	}

}
