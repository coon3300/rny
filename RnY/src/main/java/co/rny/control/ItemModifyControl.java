package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.ItemVO;

public class ItemModifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
//		String sc = req.getParameter("searchCondition");
		String sc = "T";
		String kw = req.getParameter("keyword");
		kw = kw == null ? "" : kw;

		req.setAttribute("page", page);
		req.setAttribute("keyword", kw);

		
		
		int itemNo = Integer.parseInt(req.getParameter("itemNo"));
		
		ItemService svc = new ItemServiceImpl();
				
		ItemVO ivo = svc.itemSelectedAll(itemNo);
		
		req.setAttribute("ivo", ivo);
		
    	req.getRequestDispatcher("RnY/itemModify.tiles").forward(req, resp);

	}

}
