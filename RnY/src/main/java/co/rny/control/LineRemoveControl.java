package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineRemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lineNo = req.getParameter("lineNo");
		
		LineService svc = new LineServiceImpl();
		
		LineVO ivo = new LineVO();
		
		ivo.setLineNo(Integer.parseInt(lineNo));

		if(svc.deleteLine(ivo)) {
			// 목록으로 이동.
			resp.sendRedirect("lineManage.do");
		}else {
			// 수정페이지로 이동.
			resp.sendRedirect("lineModify.do?lineNo=" + lineNo);
		}

	}

}
