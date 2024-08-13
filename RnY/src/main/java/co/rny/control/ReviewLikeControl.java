package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;

public class ReviewLikeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String reviewNum = req.getParameter("reviewNum"); 
		ReviewService rvs = new ReviewServiceImpl();
		
		Map<String, Object> map = new HashMap<>();

		try {

			if (rvs.reviewLike(Integer.parseInt(reviewNum))) {
				map.put("retCode", "Success");
			}

		} catch (Exception e) {
			map.put("retCode", "Fail");
		}
		// json문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		resp.getWriter().print(json);
	}
}