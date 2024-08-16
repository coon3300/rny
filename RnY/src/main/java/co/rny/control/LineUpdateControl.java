package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lineNo = req.getParameter("lineNo");
		String lineParentNo = req.getParameter("lineParentNo");
		String lineName = req.getParameter("lineName");
		String lineDesc = req.getParameter("lineDesc");

		
		LineService svc = new LineServiceImpl();
		
		LineVO lvo = new LineVO();
		lvo.setLineNo(Integer.parseInt(lineNo));
		lvo.setLineParentNo(Integer.parseInt(lineParentNo));
		lvo.setLineName(lineName);
		lvo.setLineDesc(lineDesc);
		
		
		if(svc.modifyLine(lvo)) {
			// 목록으로 이동.
			resp.sendRedirect("lineManage.do");
		}else {
			// 수정페이지로 이동.
			resp.sendRedirect("lineModify.do?lineNo=" + lineNo);
		}
	}

}
