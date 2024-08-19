package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.BuyService;
import co.rny.service.BuyServiceImpl;
import co.rny.vo.BuyVO;

public class BuyDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String buyNo = req.getParameter("buyNo");
        
		BuyService svc = new BuyServiceImpl();
		
		List<BuyVO> list = svc.buyListDetail(Integer.parseInt(buyNo));
		
		req.setAttribute("buyListDetail", list);
		
		req.getRequestDispatcher("RnY/buyDetail.tiles").forward(req, resp);

	}

}
