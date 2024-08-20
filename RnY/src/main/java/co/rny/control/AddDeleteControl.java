package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;

public class AddDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mainAdd = req.getParameter("mainAdd");
		System.out.println(mainAdd);

		MemberService svc = new MemberServiceImpl();

		if (svc.removeadd(mainAdd)) {
			// 목록으로 이동
//			resp.sendRedirect("myaddress.do");
			resp.getWriter().print("{\"retCode\":\"Success\"}");
		} else {
			// 삭제페이지로 이동
//			resp.sendRedirect("myaddress.do");
			resp.getWriter().print("{\"retCode\":\"Fail\"}");
		}

	}

}
