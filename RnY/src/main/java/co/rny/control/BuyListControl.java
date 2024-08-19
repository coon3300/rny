package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.BuyService;
import co.rny.service.BuyServiceImpl;
import co.rny.vo.BuyVO;

public class BuyListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        HttpSession session = req.getSession();
        String logid = (String) session.getAttribute("logid");
        
		BuyService svc = new BuyServiceImpl();
		
		List<BuyVO> list = svc.buyList(logid);
		
		req.setAttribute("buyList", list);
		
		req.getRequestDispatcher("RnY/buyList.tiles").forward(req, resp);

	}

}
