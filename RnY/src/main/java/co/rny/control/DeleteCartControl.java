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
        int cartNo = Integer.parseInt(req.getParameter("cno"));
        
        CartService cartService = new CartServiceImpl();
        cartService.deleteCartItem(cartNo);
        
        // 장바구니 목록으로 리다이렉트
        resp.sendRedirect("cart.do");
    }
}