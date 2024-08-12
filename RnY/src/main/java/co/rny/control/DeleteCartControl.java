package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;

public class DeleteCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cno = req.getParameter("cno");
		
		CartService csv = new CartServiceImpl();
		if(csv.removeCart(Integer.parseInt(cno))) {
			// 목록으로 이동.
			resp.sendRedirect("cart.do");
		} 
//		else {
//			resp.sendRedirect("wish.do" );
//		}
		
	}

}
