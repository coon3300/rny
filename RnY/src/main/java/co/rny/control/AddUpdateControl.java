package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.AddressVO;

public class AddUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mainAdd = req.getParameter("mainAdd");
		String userNo = req.getParameter("userNo");
		AddressVO avo = new AddressVO();
		avo.setUserNo(userNo);
		avo.setMainAdd(mainAdd);

		MemberService svc = new MemberServiceImpl();
		svc.modifyaddress(avo);
		// {"retCode":"Success"}
		resp.getWriter().print("{\"retCode\":\"Success\"}");

	}

}
