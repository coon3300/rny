package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LineService svc = new LineServiceImpl();
    	List<LineVO> lineList = svc.lineList();
    	req.setAttribute("lineList", lineList);
    	req.getRequestDispatcher("manage/lineManage.tiles").forward(req, resp);
	}

}
