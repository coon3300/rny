package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.common.SearchVO;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.LineVO;

public class LineManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		LineService svc = new LineServiceImpl();
//		String sc = req.getParameter("searchCondition");
		String sc = "T";
		String kw = req.getParameter("keyword");
		kw = kw == null ? "" : kw;

		SearchVO search = new SearchVO();
		search.setKeyword(kw);
		search.setPage(Integer.parseInt(page));
		search.setSearchCondition(sc);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		
		//List<ItemVO> list = svc.itemListSearched(keyword);
		List<LineVO> list = svc.lineListSearched(search);
		
		req.setAttribute("lineList", list);
		
		int totalCnt = svc.totalCount(search);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page),totalCnt, 8);
		req.setAttribute("paging", pageDTO);
		req.setAttribute("keyword", kw);
		req.setAttribute("searchCondition", sc);		
		
    	req.getRequestDispatcher("RnY/lineManage.tiles").forward(req, resp);

	}

}
