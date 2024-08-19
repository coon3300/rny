package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.CartVO;

public class AddCartNewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("logid");
        
        
        String itemNo = req.getParameter("itemNo");
        String quantity = req.getParameter("quantity");

        CartService cartService = new CartServiceImpl();
        
        
        CartVO cartItem = new CartVO();
        

        // 장바구니 목록으로 리다이렉트
        resp.sendRedirect("cart.do");

	}

}
