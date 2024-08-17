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
import co.rny.vo.OrderVO;

public class AddCartControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userNo = (String) session.getAttribute("userNo");
        int itemNo = Integer.parseInt(req.getParameter("itemNo"));
        
        // 수량 수정
        String quantityStr = req.getParameter("quantity");
        if (quantityStr == null || quantityStr.isEmpty()) {
            // 기본값을 설정하거나, 예외 처리
            quantityStr = "1"; // 예: 기본 수량 1로 설정
        }
        int quantity = Integer.parseInt(quantityStr);

        //int quantity = Integer.parseInt(req.getParameter("quantity")); // 수량(성철)
       
        
        String id = (String) session.getAttribute("logid");

        //CartService cartService = new CartServiceImpl();
        
        CartVO cartItem = new CartVO();
        cartItem.setUserNo(userNo);
        cartItem.setItemNo(itemNo);
        cartItem.setQuantity(quantity);
        
        
        cartService.addOrUpdateCartItem(cartItem);

        // 장바구니 목록으로 리다이렉트
        resp.sendRedirect("cart.do");
    }
}