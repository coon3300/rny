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

public class DeleteReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rvo = req.getParameter("rvo"); //
		QnaReplyService svc = new QnaReplyServiceImpl();
		Map<String, Object> map = new HashMap<>();

		try {
			if (svc.deleteReply(Integer.parseInt(rvo))) {
				map.put("retCode", "Success");
			} else {
				map.put("retCode", "fail1");
			}

		} catch (Exception e) {
			map.put("retCode", "fail2");
			e.printStackTrace();

		}
		// json문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		resp.getWriter().print(json);
	}
}
