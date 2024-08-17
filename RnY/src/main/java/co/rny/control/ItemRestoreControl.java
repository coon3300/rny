package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.ItemVO;

public class ItemRestoreControl implements Control {

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
		
		
		
		String itemNo = req.getParameter("itemNo");
		
		ItemService svc = new ItemServiceImpl();
		
		ItemVO ivo = new ItemVO();
		
		ivo.setItemNo(Integer.parseInt(itemNo));

		if(svc.deleteItemCancel(ivo)) {
			// 목록으로 이동.
			// resp.sendRedirect("itemManage.do");
	    	req.getRequestDispatcher("itemManage.do").forward(req, resp);

		}else {
			// 수정페이지로 이동.
			resp.sendRedirect("itemModify.do?itemNo=" + itemNo);
		}

	}

}
