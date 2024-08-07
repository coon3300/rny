package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.NoticeService;
import co.rny.service.NoticeServiceImpl;
import co.rny.vo.NoticeVO;

public class NoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nno = req.getParameter("nno");
		String page = req.getParameter("page");
		
		NoticeService nvc = new NoticeServiceImpl();
		NoticeVO notice = nvc.getBoard(Integer.parseInt(nno));
		
		req.setAttribute("notice", notice);
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("notice/notice.tiles")//
		.forward(req, resp); // 페이지 재지정.
		
	}

}
