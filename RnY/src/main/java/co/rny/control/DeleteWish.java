package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;

public class DeleteWish implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String wno = req.getParameter("wno");
		
		WishService wsv = new WishServiceImpl();
		if(wsv.removeWish(Integer.parseInt(wno))) {
			// 목록으로 이동.
			resp.sendRedirect("wish.do");
		} 
//		else {
//			resp.sendRedirect("wish.do" );
//		}
	}

}
