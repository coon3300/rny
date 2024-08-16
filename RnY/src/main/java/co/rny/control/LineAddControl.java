package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");		
		String lineParentNo = req.getParameter("lineParentNo");
		String lineName = req.getParameter("lineName");
		String lineDesc = req.getParameter("lineDesc");
	
		LineService svc = new LineServiceImpl();
		LineVO lvo = new LineVO();
		
		lvo.setLineParentNo(Integer.parseInt(lineParentNo));
		lvo.setLineName(lineName);
		lvo.setLineDesc(lineDesc);
//		req.getRequestDispatcher("WEB-INF/jsp/boardList.jsp") //
//		.forward(req, resp); // 페이지 재지정
//		
		if(svc.addLine(lvo)) {
			// 목록이동.
			resp.sendRedirect("lineManage.do");
		}

	}

}
