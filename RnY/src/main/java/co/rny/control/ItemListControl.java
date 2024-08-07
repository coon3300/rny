package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.service.LineService;
import co.rny.service.LineServiceImpl;
import co.rny.vo.ItemVO;

public class ItemListControl implements Control  {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ItemService svc = new ItemServiceImpl();
		
		int lineNo = Integer.parseInt(req.getParameter("lineNo"));
		
		List<ItemVO> list = svc.itemList(lineNo);
		req.setAttribute("itemList", list);
		
		LineService svc2 = new LineServiceImpl();
		
		String lineName = svc2.lineName(lineNo);
		
		req.setAttribute("lineName", lineName);
		
    	req.getRequestDispatcher("RnY/itemList.tiles").forward(req, resp);
	}

}
