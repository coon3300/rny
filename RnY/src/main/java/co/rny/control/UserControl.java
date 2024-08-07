package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.MemberVO;

public class UserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 단건조회기능
		String uno = req.getParameter("uno");

		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.userinfo(uno);

		req.setAttribute("mvo", mvo);

		req.getRequestDispatcher("member/userinfo.tiles").forward(req, resp);

	}

}
