package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.BasketService;
import co.rny.service.BasketServiceImpl;
import co.rny.service.BuyService;
import co.rny.service.BuyServiceImpl;

public class BuyAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		
        HttpSession session = req.getSession();
        String logid = (String) session.getAttribute("logid");
        
        BuyService svc = new BuyServiceImpl();
        BasketService service = new BasketServiceImpl();
        
        try {
        	svc.addBuy(logid);
        	svc.addBuyDetail(logid);
        	service.delBasketDetail(logid);
        	service.delBasket(logid);
        	req.getRequestDispatcher("RnY/buyAdd.tiles").forward(req, resp);
			
		} catch (Exception e) {
			// TODO: handle exception
			resp.sendRedirect("buy.do");
		}
	}

}
