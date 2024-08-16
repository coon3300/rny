package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineModifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		LineService svc = new LineServiceImpl();
		
		int lineNo = Integer.parseInt(req.getParameter("lineNo"));
		
		LineVO lvo = svc.lineSelectedAll(lineNo);
		
		req.setAttribute("lvo", lvo);
		
    	req.getRequestDispatcher("RnY/lineModify.tiles").forward(req, resp);
	}

}
