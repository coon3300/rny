package co.rny.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.QnaReplyService;
import co.rny.service.QnaReplyServiceImpl;
import co.rny.vo.QnaReplyVO;

public class QnaReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String writer = req.getParameter("userNo");
		String content = req.getParameter("content");
		String qno = req.getParameter("qno");

		QnaReplyVO qvo = new QnaReplyVO();
		qvo.setQnaNum(Integer.parseInt(qno));
		qvo.setQreplyContent(content);
		qvo.setUserNo(writer);

		QnaReplyService qvc = new QnaReplyServiceImpl();
		Map<String, Object> map = new HashMap<>();

		try {

			if (qvc.qnaReply(qvo)) {
				map.put("retCode", "Success");
				map.put("retVal", qvo);
			}

		} catch (Exception e) {
			map.put("retCode", "Fail");
			map.put("retVal", null);
		}
		// json문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		resp.getWriter().print(json);

	}

}
