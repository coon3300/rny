package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.ItemVO;

public class ItemAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// key-value 처리위한 application/x-www-form-rulencode 방식
		String lineNo = req.getParameter("lineNo");
		String itemCode = req.getParameter("itemCode");
		String itemName = req.getParameter("itemName");
		String itemDesc = req.getParameter("itemDesc");
		String itemPrice = req.getParameter("itemPrice");
		String itemStock = req.getParameter("itemStock");
		String itemImage = req.getParameter("itemImage");
		
		// 파일전송 multipart/form-data 방식. cos라이브러리.
		// 1.파일업로도 (image) 2.DB입력.
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5; // 5MB 
		MultipartRequest request = new MultipartRequest(req // 1.요청정보.
				, savePath // 2.업로드 경로.
				, maxSize // 3.최대 크기 지정.
				, "UTF-8" // 4.파일명 해석 인코딩방식지정.
				, new DefaultFileRenamePolicy() // 5.리네임정책.
		);
		lineNo = request.getParameter("lineNo");
		itemCode = request.getParameter("itemCode");
		itemName = request.getParameter("itemName");
		itemDesc = request.getParameter("itemDesc");
		itemPrice = request.getParameter("itemPrice");
		itemStock = request.getParameter("itemStock");
		itemImage = request.getFilesystemName("itemImage");
		
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		ivo.setLineNo(Integer.parseInt(lineNo));
		ivo.setItemCode(itemCode);
		ivo.setItemName(itemName);
		ivo.setItemDesc(itemDesc);
		ivo.setItemPrice(Integer.parseInt(itemPrice));
		ivo.setItemStock(Integer.parseInt(itemStock));
		ivo.setItemImage(itemImage);
		
		System.out.println(ivo);
//		req.getRequestDispatcher("WEB-INF/jsp/boardList.jsp") //
//		.forward(req, resp); // 페이지 재지정
//		
		if(svc.addItem(ivo)) {
			// 목록이동.
			resp.sendRedirect("itemManage.do");
		}

	}

}
