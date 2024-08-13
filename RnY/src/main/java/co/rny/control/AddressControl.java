package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.vo.AddressVO;

public class AddressControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String userNo = (String) session.getAttribute("userNo");

		String addName = req.getParameter("addName");
		String recipient = req.getParameter("recipient");
		String addPhone = req.getParameter("addPhone");
		String newAddress1 = req.getParameter("newAddress1");
		String newAddress2 = req.getParameter("newAddress2");
		String newAddress3 = req.getParameter("newAddress3");
		String newAddress = newAddress1 + newAddress2 + newAddress3;

		MemberService svc = new MemberServiceImpl();

		AddressVO avo = new AddressVO();
		avo.setUserNo(userNo);
		avo.setAddName(addName);
		avo.setRecipient(recipient);
		avo.setAddPhone(addPhone);
		avo.setNewAddress(newAddress);

		svc.address(avo);
		resp.sendRedirect("myaddress.do");

	}

}
