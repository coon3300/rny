package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.service.QnaListService;
import co.rny.service.QnaListServiceImpl;
import co.rny.vo.QnaListVO;

public class QnaListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		QnaListService qvc = new QnaListServiceImpl();
		int qnaCnt = qvc.qnaCnt();
		
		PageDTO paging = new PageDTO(Integer.parseInt(page), qnaCnt);
		List<QnaListVO> list = qvc.qnaPaging(Integer.parseInt(page));
		req.setAttribute("qnaPaging", list); // QnA페이징
		
		System.out.println(paging);
		req.setAttribute("page", paging);

		req.getRequestDispatcher("qna/qnaList.tiles")//
				.forward(req, resp); // 페이지 재지정.
	}

}
