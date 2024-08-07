package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		OrderService ovc = new OrderServiceImpl();
		
		List<OrderVO> list = ovc.orderList();
		req.setAttribute("orderList", list);
		req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);
	}
	

}
