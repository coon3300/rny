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
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.ItemVO;

public class ItemListLineControl implements Control  {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String lineNo = req.getParameter("lineNo");
		lineNo = lineNo == null ? "11" : lineNo;
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		ItemService svc = new ItemServiceImpl();
//		String sc = req.getParameter("searchCondition");
		String sc = "T";
		String kw = req.getParameter("keyword");

		SearchVO search = new SearchVO();
		search.setKeyword(kw);
		search.setPage(Integer.parseInt(page));
		search.setSearchCondition(sc);
		search.setLineNo(Integer.parseInt(lineNo));
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		
		//List<ItemVO> list = svc.itemListSearched(keyword);
		List<ItemVO> list = svc.itemListLine(search);
		
		req.setAttribute("itemList", list);
		//req.setAttribute("lineName", "검색 : "+ keyword);
		req.setAttribute("lineName", "");
		
		
		int totalCnt = svc.totalCountLine(search);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page),totalCnt, 8);
		req.setAttribute("paging", pageDTO);
		req.setAttribute("keyword", kw);
		req.setAttribute("searchCondition", sc);		
		req.setAttribute("lineNo", lineNo);		

		LineService svc2 = new LineServiceImpl();
		
		String lineName = svc2.lineName(Integer.parseInt(lineNo));
		
		req.setAttribute("lineName", lineName);		
		
    	req.getRequestDispatcher("RnY/itemList.tiles").forward(req, resp);
	}

}
