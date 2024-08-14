package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.common.SearchVO;
import co.rny.service.NoticeService;
import co.rny.service.NoticeServiceImpl;
import co.rny.vo.NoticeVO;

public class NoticeAdmControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		

		NoticeService nvc = new NoticeServiceImpl();

		SearchVO search = new SearchVO();
		search.setKeyword(kw);
		search.setPage(Integer.parseInt(page));
		search.setSearchCondition(sc);
		
		
		List<NoticeVO> list = nvc.noticeAdm(page);
		req.setAttribute("noticeList", list);
		int totalCnt = nvc.totalCnt();


		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt, 10);

		
		req.setAttribute("memberList", list);
		req.setAttribute("paging", paging);
		
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);

		req.getRequestDispatcher("admin/noticeAdm.tiles") 
				.forward(req, resp); // 페이지 재지정

	}

}
