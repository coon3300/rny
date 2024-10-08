package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.AddressVO;

public class MyAddressControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		HttpSession session = req.getSession();
		String userNo = (String) session.getAttribute("userNo");
		
		AddressVO avo = new AddressVO();
		avo.setUserNo(userNo);
		
		MemberService svc = new MemberServiceImpl();
		List<AddressVO> list = svc.myaddressList(avo);
		
		req.setAttribute("addList", list);
		
		req.getRequestDispatcher("member/myaddress.tiles") // tiles.xml "/WEB-INF/jsp/{1}.jsp"
		.forward(req, resp); // 페이지 재지정

	}

}
