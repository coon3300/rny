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
import co.rny.vo.ItemVO;

public class ItemManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		ItemService svc = new ItemServiceImpl();
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
		List<ItemVO> list = svc.itemListSearchedAll(search);
		
		req.setAttribute("itemList", list);
		//req.setAttribute("lineName", "검색 : "+ keyword);
		req.setAttribute("lineName", "");
		
		
		int totalCnt = svc.totalCount(search);
		PageDTO pageDTO = new PageDTO(Integer.parseInt(page),totalCnt, 8);
		req.setAttribute("paging", pageDTO);
		req.setAttribute("keyword", kw);
		req.setAttribute("searchCondition", sc);		
		
    	req.getRequestDispatcher("RnY/itemManage.tiles").forward(req, resp);
	}

}
