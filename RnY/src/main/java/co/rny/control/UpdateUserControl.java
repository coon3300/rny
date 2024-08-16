package co.rny.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
		  resp.setContentType("text/html;charset=utf-8");

	        String userNo = req.getParameter("userNo");
	        String userPw = req.getParameter("userPw");
	        String userNick = req.getParameter("userNick");
	        String userBirth = req.getParameter("userBirth");
	        String userPhone = req.getParameter("userPhone");
	        String userEmail = req.getParameter("userEmail");

	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        MemberService svc = new MemberServiceImpl();
	        MemberVO mvo = svc.userinfo(userNo);  // 기존 사용자 정보 가져오기

	        // 입력된 비밀번호가 없으면 기존 비밀번호 유지
	        if (userPw != null && !userPw.trim().isEmpty()) {
	            mvo.setUserPw(userPw);
	        }

	        mvo.setUserNick(userNick);
	        try {
	            mvo.setUserBirth(sdf.parse(userBirth));
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        mvo.setUserPhone(userPhone);
	        mvo.setUserEmail(userEmail);

	        if (svc.modifymember(mvo)) {
	            resp.sendRedirect("mypage.do");
	        } else {
	            resp.sendRedirect("updateuserform.do");
	        }
		
		

	}

}
