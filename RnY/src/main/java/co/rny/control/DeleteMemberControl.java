package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.MemberVO;

public class DeleteMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userNo = req.getParameter("userNo");

		MemberService svc = new MemberServiceImpl();
		if (svc.checkMainAdd(userNo) > 0) {
			HttpSession session = req.getSession();
			session.setAttribute("mainAddMsg", "주소지 정보를 삭제후 다시 삭제하세요..");
			resp.sendRedirect("memberList.do");
			return;
		}

		if (svc.removemember(userNo)) {
			// 목록으로 이동
			resp.sendRedirect("memberList.do");
		} else {
			// 삭제페이지로 이동
			resp.sendRedirect("memberList.do");
		}

	}

}
