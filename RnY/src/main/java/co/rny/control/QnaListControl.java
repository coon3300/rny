package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.QnaListService;
import co.rny.service.QnaListServiceImpl;
import co.rny.vo.QnaListVO;

public class QnaListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QnaListService qvc = new QnaListServiceImpl();
		List<QnaListVO> list = qvc.qnaList();
		req.setAttribute("qnaList", list);

		req.getRequestDispatcher("qna/qnaList.tiles")//
				.forward(req, resp); // 페이지 재지정.
	}

}
