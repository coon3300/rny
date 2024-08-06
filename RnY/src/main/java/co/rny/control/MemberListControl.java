package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.MemberVO;

public class MemberListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		MemberService svc = new MemberServiceImpl();
		List<MemberVO> list = svc.memberList();

		req.setAttribute("memberList", list);

		req.getRequestDispatcher("member/memberList.tiles") // tiles.xml "/WEB-INF/jsp/{1}.jsp"
				.forward(req, resp); // 페이지 재지정

	}

}
