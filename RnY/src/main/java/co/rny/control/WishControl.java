package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;
import co.rny.vo.WishVO;

public class WishControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		WishService wvc = new WishServiceImpl();
		
		List<WishVO> list = wvc.wishlist();
		req.setAttribute("wishlist", list);
		
		MemberVO mvo = new MemberVO();
		req.setAttribute("mvo", mvo);
		
		ItemVO ivo = new ItemVO();
		req.setAttribute("ivo", ivo);
		req.getRequestDispatcher("RnY/wish.tiles").forward(req, resp);
	}

}
