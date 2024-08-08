package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.QnaReplyService;
import co.rny.service.QnaReplyServiceImpl;
import co.rny.vo.QnaReplyVO;

public class QnaReplyListControl implements Control {
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String qno = req.getParameter("qno");
		
		QnaReplyVO qre = new QnaReplyVO();
		qre.setQnaNum(Integer.parseInt(qno));
		
		QnaReplyService qvc = new QnaReplyServiceImpl();
		List<QnaReplyVO> list = qvc.qreplyList(qre);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);

		resp.getWriter().print(json);
		
		

	}

}
