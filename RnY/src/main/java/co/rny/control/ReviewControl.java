package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reviewNum = req.getParameter("reviewNum");
		
		ReviewService rvc = new ReviewServiceImpl();
		ReviewVO rvo = rvc.selectReview(Integer.parseInt(reviewNum));
		
		req.setAttribute("rvo", rvo);
		
		req.getRequestDispatcher("review/review.tiles")//
		.forward(req, resp); // 페이지 재지정.
		

	};

}
