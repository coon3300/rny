package co.rny.control;

import java.io.IOException;
import java.util.List;

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
		
		ItemService svc = new ItemServiceImpl();
		
		int itemNo = Integer.parseInt(req.getParameter("itemNo"));
		
		ItemVO ivo = svc.itemSelectedAll(itemNo);
		
		req.setAttribute("ivo", ivo);
		
    	req.getRequestDispatcher("RnY/itemModify.tiles").forward(req, resp);

	}

}
