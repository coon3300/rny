package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.NoticeService;
import co.rny.service.NoticeServiceImpl;
import co.rny.vo.NoticeVO;

public class noticeAdmDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 단건조회기능
		String nno = req.getParameter("noticeNum");
		System.out.println(nno);
		NoticeService nvc = new NoticeServiceImpl();
		NoticeVO nvo = nvc.noticeAdmDetail(Integer.parseInt(nno));

		req.setAttribute("nvo", nvo);

		req.getRequestDispatcher("notice/noticeAdmDetail.tiles").forward(req, resp);

	}

}
