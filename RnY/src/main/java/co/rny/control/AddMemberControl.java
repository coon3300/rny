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
		resp.setContentType("text/html;charset=utf-8");

		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		String userName = req.getParameter("userName");
		String userNick = req.getParameter("userNick");
		String userBirth = req.getParameter("userBirth");
		String userEmail = req.getParameter("userEmail");
		String userPhone = req.getParameter("userPhone");
		String userAdd1 = req.getParameter("userAdd1");
		String userAdd2 = req.getParameter("userAdd2");
		String userAdd3 = req.getParameter("userAdd3");
		String userAdd4 = req.getParameter("userAdd4");
		String userAdd = userAdd1+userAdd2+userAdd3+userAdd4;
		String responsibility = req.getParameter("responsibility");
		
		System.out.println("userBirth: " + userBirth);

//	    // userBirth가 null인지 확인
//	    if (userBirth == null || userBirth.isEmpty()) {
//	        // 에러 처리 또는 기본값 설정
//	        userBirth = "2000-01-01"; // 예시 기본값
//	    }
		
		MemberService svc = new MemberServiceImpl();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


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

		svc.addMember(mvo);
		
		resp.sendRedirect("main.do");
	}
}
