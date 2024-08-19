package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.BasketService;
import co.rny.service.BasketServiceImpl;
import co.rny.vo.BasketVO;

public class BuyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        HttpSession session = req.getSession();
        String logid = (String) session.getAttribute("logid");
        
		BasketService svc = new BasketServiceImpl();
		
		List<BasketVO> list = svc.buyList(logid);
		
		req.setAttribute("buyList", list);
		
		req.getRequestDispatcher("RnY/buy.tiles").forward(req, resp);
	}

}
