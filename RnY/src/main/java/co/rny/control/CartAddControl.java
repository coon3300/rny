package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.CartListService;
import co.rny.service.CartListServiceImpl;
import co.rny.vo.CartListVO;

public class CartAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartListService cartListService = new CartListServiceImpl();
		
		String itemNo = req.getParameter("itemNo");
		String userNo = req.getParameter("userNo");
		System.out.println("itemNo:" + itemNo + "userNo:" + userNo);
		
		CartListVO cartListVO = new CartListVO();
		cartListVO.setItemNo(Integer.parseInt(itemNo));
		cartListVO.setUserNo(userNo);		
		
		
		String json;
		if(cartListService.insertCartList(cartListVO)) {
			json= String.format("{\"%s\":\"%s\"}", "addCart","Success");
			resp.sendRedirect(req.getContextPath() + "/cartList.do");
		}else {
			json= String.format("{\"%s\":\"%s\"}", "addCart","Failed");
			resp.sendRedirect(req.getContextPath() + "/main.do");
		}
		resp.getWriter().print(json);
		
	}

}
