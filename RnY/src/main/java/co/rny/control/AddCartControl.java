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
import co.rny.vo.ItemVO;
import co.rny.vo.MemberVO;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터
				String userNo = req.getParameter("userNo");
				String itemNo = req.getParameter("itemNo");
				String cartCount = req.getParameter("cartCount");
				HttpSession session = req.getSession();
				String id = (String) session.getAttribute("logid");

				CartService csv = new CartServiceImpl();
				
				CartVO existingCart = csv.getCartItem(userNo, itemNo);
		        if (existingCart != null) {
		            // 이미 장바구니에 동일한 항목이 있으면 수량 업데이트
		            int newCount = existingCart.getCartCnt() + Integer.parseInt(cartCount);
		            existingCart.setCartCnt(newCount);
		            csv.updateCartCount(existingCart);
		        } else {
		            // 장바구니에 새로운 항목 추가
		            CartVO cvo = new CartVO();
		            cvo.setUserNo(userNo);
		            cvo.setItemNo(Integer.parseInt(itemNo));
		            cvo.setCartCnt(Integer.parseInt(cartCount));
		            csv.addCart(cvo);
		        }

				//ItemVO ivo = new ItemVO();
				//MemberVO mvo = new MemberVO();
				//CartVO cvo = new CartVO();
				//OrderVO ovo = new OrderVO();
				//cvo.setCartCnt(Integer.parseInt(cartCount));
				//mvo.setItemNo(Integer.parseInt(itemNo));
				//mvo.setUserNo(userNo);
				

				// wsv.addWish(ivo, mvo);
				// wsv.addWish(userNo, Integer.parseInt(itemNo));
				//csv.addCart(mvo);

				resp.sendRedirect("order.do");
	}

}
