package co.rny.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.MemberVO;

public class AddMemberControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		String userName = req.getParameter("userName");
		String userNick = req.getParameter("userNick");
		String userBirth = req.getParameter("userBirth");
		String userEmail = req.getParameter("userEmail");
		String userPhone = req.getParameter("userPhone");
		String userAdd = req.getParameter("userAdd");
		String responsibility = req.getParameter("responsibility");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");

		MemberVO mvo = new MemberVO();
		mvo.setUserId(userId);
		mvo.setUserPw(userPw);
		mvo.setUserName(userName);
		mvo.setUserNick(userNick);
		try {
			mvo.setUserBirth(sdf.parse(userBirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		mvo.setUserEmail(userEmail);
		mvo.setUserPhone(userPhone);
		mvo.setUserAdd(userAdd);
		mvo.setResponsibility(responsibility);

		MemberService svc = new MemberServiceImpl();
		svc.addMember(mvo);
		
		resp.sendRedirect("main.do");
	}
}
