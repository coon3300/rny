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

		// req.getRequestDispatcher("RnY/ordercheck.tiles").forward(req, resp);
	}

}
