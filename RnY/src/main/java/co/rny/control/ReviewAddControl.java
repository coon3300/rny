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
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String itemNo = req.getParameter("itemNo");
		String reviewContent = req.getParameter("reviewContent");
		String userId = req.getParameter("userId");
		
		
		MemberService svc1 = new MemberServiceImpl();
		String userNo = svc1.userCheck(userId);
		
		ReviewVO rvo = new ReviewVO();
		rvo.setItemNo(Integer.parseInt(itemNo));
		rvo.setReviewContent(reviewContent);
		rvo.setReviewTitle(reviewContent); //임시로 content 저장
		rvo.setUserId(userId);
		rvo.setUserNo(userNo);
		
		ReviewService svc = new ReviewServiceImpl();
		// retCode: Success, retVal: ReviewVO
		// retCode: Fail, retVal: null
		Map<String, Object> map = new HashMap<>();
		
		try {
			if(svc.addReview(rvo)) {
				map.put("retCode", "Success");
				map.put("retVal", rvo);
			}
		}catch(Exception e) {
			// e.printStackTrace();
			map.put("retCode", "Fail");
			map.put("retVal", null);
		}
		// json문자열 생성.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		
		resp.getWriter().print(json);

	}

}
