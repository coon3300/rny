package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;

public class DeleteMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userNo = req.getParameter("userNo");
		
		MemberService svc = new MemberServiceImpl();
		
		if(svc.removemember(userNo)) {
			// 목록으로 이동
			resp.sendRedirect("memberList.do");
		} else {
			// 삭제페이지로 이동
			resp.sendRedirect("memberList.do");
		}
		

	}

}
