package co.rny.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.rny.common.Control;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewAddFileControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String itemNo = req.getParameter("itemNo");
		String reviewContent = req.getParameter("reviewContent");
		
		String userId = req.getParameter("userId");
		

		
		// 파일전송 multipart/form-data 방식. cos라이브러리.
		// 1.파일업르도 (image) 2.DB입력.
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5; // 5MB 
		MultipartRequest request = new MultipartRequest(req // 1.요청정보.
				, savePath // 2.업로드 경로.
				, maxSize // 3.최대 크기 지정.
				, "UTF-8" // 4.파일명 해석 인코딩방식지정.
				, new DefaultFileRenamePolicy() // 5.리네임정책.
		);
		itemNo = request.getParameter("itemNo");
		reviewContent = request.getParameter("reviewContent");
		userId = request.getParameter("userId");
		String reviewImage = request.getFilesystemName("reviewImage"); // boardForm.jsp 메소드 값과 일치		

		
		
		ReviewVO rvo = new ReviewVO();
		rvo.setItemNo(Integer.parseInt(itemNo));
		rvo.setReviewContent(reviewContent);
		rvo.setReviewTitle(reviewContent); //임시로 content 저장
		rvo.setUserId(userId);
		rvo.setReviewImage(reviewImage);
		
		MemberService svc1 = new MemberServiceImpl();
		String userNo = svc1.userCheck(userId);
		rvo.setUserNo(userNo);
		
		System.out.println(rvo);
		
		
		
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
