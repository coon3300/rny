package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.QnaListService;
import co.rny.service.QnaListServiceImpl;
import co.rny.vo.QnaListVO;

public class QnaControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qnaNum = req.getParameter("qnaNum");
		
		QnaListService qvc = new QnaListServiceImpl();
		QnaListVO qvo = qvc.selectQna(Integer.parseInt(qnaNum));
		
		req.setAttribute("qvo", qvo);
		
		req.getRequestDispatcher("qna/qna.tiles")//
		.forward(req, resp); // 페이지 재지정.
		

	};

}
