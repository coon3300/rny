package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;

public class CartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CartService cs = new CartServiceImpl();
		
		
		
		req.getRequestDispatcher("RnY/cart.tiles").forward(req, resp);
	}

}
