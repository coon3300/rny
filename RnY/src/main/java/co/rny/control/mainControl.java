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
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.ItemVO;

public class mainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		LineService svc = new LineServiceImpl();
    	List<LineVO> lineList = svc.lineList();
    	req.setAttribute("lineList", lineList);
		 * 
		 */
		ItemService svc = new ItemServiceImpl();
		List<ItemVO> itemListBest = svc.itemListBest();
		req.setAttribute("itemListBest", itemListBest);
		List<ItemVO> itemListNew = svc.itemListNew();
		req.setAttribute("itemListNew", itemListNew);
		
		
		
		HttpSession session = req.getSession();
        String userNo = (String) session.getAttribute("userNo");
        
        // 장바구니 서비스 인스턴스를 생성합니다.
        CartService cartService = new CartServiceImpl();
        
        // 사용자 번호로 장바구니 목록을 조회합니다.
        //List<CartVO> cartList = cartService.cartList(userNo); //0817
        
        // 요청 속성에 장바구니 목록을 설정합니다.
        //req.setAttribute("cartList", cartList); //0817
    	  req.getRequestDispatcher("RnY/main.tiles").forward(req, resp);
	}

}
