package co.rny.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.service.NoticeService;
import co.rny.service.NoticeServiceImpl;
import co.rny.vo.NoticeVO;

public class NoticeListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String page = req.getParameter("page");
		String date = req.getParameter("noticeDate");
		page = page == null ? "1" : page;

		NoticeService nvc = new NoticeServiceImpl();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");

		NoticeVO nvo = new NoticeVO();
		try {
			nvo.setNoticeDate(sdf.parse(date));
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<NoticeVO> list = nvc.noticeList(page);
		req.setAttribute("noticeList", list);
		int totalCnt = nvc.totalCnt();

		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt, 3);
		System.out.println(paging);
		req.setAttribute("page", paging);

		req.getRequestDispatcher("notice/noticeList.tiles")//
				.forward(req, resp); // 페이지 재지정.

	}

}
