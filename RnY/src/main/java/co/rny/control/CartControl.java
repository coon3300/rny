package co.rny.control;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.CartVO;

public class CartControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userNo = (String) session.getAttribute("userNo"); // 사용자 번호 가져오기

        CartService cartService = new CartServiceImpl();
        
        // 장바구니 목록 가져오기
        List<CartVO> cartList = cartService.cartList(userNo);
        
        // 요청 속성에 장바구니 목록 저장
        req.setAttribute("cartList", cartList);

        // JSP 페이지로 포워딩
        req.getRequestDispatcher("RnY/cart.tiles").forward(req, resp); // 장바구니 페이지로 포워딩
    }
}

// 장바구니 목록을 메뉴에서 간략히 보여주는 Control
class MenuCartControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userNo = (String) session.getAttribute("userNo"); // 사용자 번호 가져오기

        CartService cartService = new CartServiceImpl();
        
        // 장바구니 목록 가져오기
        List<CartVO> cartList = cartService.cartList(userNo);
        
        // 요청 속성에 장바구니 목록 저장
        req.setAttribute("cartList", cartList);

        // JSP 페이지로 포워딩
        req.getRequestDispatcher("RnY/menu.jsp").forward(req, resp); // 메뉴 페이지로 포워딩
    }
}

class UpdateCartQuantityControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userNo = (String) session.getAttribute("userNo");
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		CartService cartService = new CartServiceImpl();

		CartVO cartItem = new CartVO();
		cartItem.setCartNo(cartNo);
		cartItem.setUserNo(userNo);
		cartItem.setQuantity(quantity);

		cartService.addOrUpdateCartItem(cartItem);

		// 장바구니 목록으로 리다이렉트
		resp.sendRedirect("cart.do");
	}
}