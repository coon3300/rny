package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.ItemVO;

public class ItemUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lineNo = req.getParameter("lineNo");
		String itemNo = req.getParameter("itemNo");
		String itemCode = req.getParameter("itemCode");
		String itemName = req.getParameter("itemName");
		String itemDesc = req.getParameter("itemDesc");
		String itemPrice = req.getParameter("itemPrice");
		String itemStock = req.getParameter("itemStock");
		String itemImage = req.getParameter("itemImage");

		
		ItemService svc = new ItemServiceImpl();
		
		ItemVO ivo = new ItemVO();
		ivo.setLineNo(Integer.parseInt(lineNo));
		ivo.setItemNo(Integer.parseInt(itemNo));
		ivo.setItemCode(itemCode);
		ivo.setItemName(itemName);
		ivo.setItemDesc(itemDesc);
		ivo.setItemPrice(Integer.parseInt(itemPrice));
		ivo.setItemStock(Integer.parseInt(itemStock));
		ivo.setItemImage(itemImage);
		
		System.out.println(ivo);
		
		if(svc.modifyItem(ivo)) {
			// 목록으로 이동.
			resp.sendRedirect("itemManage.do");
		}else {
			// 수정페이지로 이동.
			resp.sendRedirect("itemModify.do?itemNo=" + itemNo);
		}
	}

}
