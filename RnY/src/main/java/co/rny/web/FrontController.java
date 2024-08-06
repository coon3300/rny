package co.rny.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.control.AddMemberControl;
import co.rny.control.ItemInfoControl;
import co.rny.control.ItemListControl;
import co.rny.control.MemberListControl;
import co.rny.control.OrderControl;
import co.rny.control.WishControl;
import co.rny.control.mainControl;

public class FrontController extends HttpServlet {

	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		// 메인
		map.put("/main.do", new mainControl());
		// 아이템 리스트
		map.put("/itemList.do", new ItemListControl());
		// 아이템 정보
		map.put("/itemInfo.do", new ItemInfoControl());

		// 회원목록 출력
		map.put("/memberList.do", new MemberListControl());
		// 회원가입
		map.put("/addMember.do", new AddMemberControl());
		
		// 주문
		map.put("/order.do", new OrderControl());
		// 위시리스트
		map.put("/wish.do", new WishControl());
		
		

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());

		Control sub = map.get(path);
		sub.exec(req, resp);

	}
}
