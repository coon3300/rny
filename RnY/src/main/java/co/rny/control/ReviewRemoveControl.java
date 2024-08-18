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
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;

public class ReviewRemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// retCode:Success, retCode:Fail 작성.
		resp.setContentType("text/json;charset=utf-8");
		
		String reviewNum = req.getParameter("reviewNum");
		
		ReviewService svc = new ReviewServiceImpl();
		// retCode: Success, retVal: ReviewVO
		// retCode: Fail, retVal: null
		Map<String, Object> map = new HashMap<>();
		
		try {
			if(svc.removeReview(Integer.parseInt(reviewNum))) {
				map.put("retCode", "Success");
			}
		}catch(Exception e) {
			// e.printStackTrace();
			map.put("retCode", "Fail");
		}
		// json문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		
		resp.getWriter().print(json);		

	}

}
