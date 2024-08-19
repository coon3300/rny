package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.BasketService;
import co.rny.service.BasketServiceImpl;
import co.rny.vo.BasketVO;

public class BasketAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("text/html; charset=UTF-8");		
		String itemNo = req.getParameter("itemNo");
		String quantity = req.getParameter("quantity");
	
		
        HttpSession session = req.getSession();
        String logid = (String) session.getAttribute("logid");

        
        BasketService svc = new BasketServiceImpl();
        if(!svc.checkBasket(logid)) {
        	svc.makeBasket(logid);
        }
        
		if(svc.addBasket(logid, Integer.parseInt(itemNo), Integer.parseInt(quantity))) {
			// 목록이동.
			resp.sendRedirect("basket.do");
		}
	}

}
