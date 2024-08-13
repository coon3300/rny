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

public class UpdateUserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uno = req.getParameter("uno");
		String userPw = req.getParameter("userPw");
		String userNick = req.getParameter("userNick");
		String userBirth = req.getParameter("userBirth");
		String userPhone = req.getParameter("userPhone");
		String userEmail = req.getParameter("userEmail");
		
		MemberVO mvo = new MemberVO();
		
		mvo.setUserNo(userNick);
		mvo.setUserPw(userPw);
		mvo.setUserNick(userNick);
		mvo.setUserBirth(null);
		mvo.setUserPhone(userPhone);
		mvo.setUserEmail(userEmail);
		
		MemberService svc = new MemberServiceImpl();
		if(svc.modifymember(mvo)) {
			resp.sendRedirect("mypage.do");
		}else {
			resp.sendRedirect("updateuser.do");
		}

		
		

	}

}
