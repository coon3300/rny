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

public class UpdateUserFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String userNo = (String) session.getAttribute("userNo");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.userinfo(userNo);
		
		req.setAttribute("userinfo", mvo);
		
		req.getRequestDispatcher("member/useriupdate.tiles").forward(req, resp); // 페이지 재지정
	}

}
