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
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.WishListVO;

public class WishControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// parameter
		MemberService svc = new MemberServiceImpl();
		String id = req.getParameter("id");
		
		// 세션객체(attribute)
		HttpSession session = req.getSession();
		
		
		
		WishService wsv = new WishServiceImpl();
		WishListVO wlv = new WishListVO();
		
		
		
		
		req.getRequestDispatcher("RnY/wish.tiles").forward(req, resp);
		
		
		
		
	}

	
}
