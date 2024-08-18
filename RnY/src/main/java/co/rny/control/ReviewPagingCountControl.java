package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;

public class ReviewPagingCountControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String itemNo = req.getParameter("itemNo");
		
		ReviewService svc = new ReviewServiceImpl();
		int totalCnt = svc.reviewTotalCnt(Integer.parseInt(itemNo));
		
		//{"totalCount" : 30}
		resp.getWriter().print("{\"totalCount\" : " + totalCnt + "}");

	}

}
