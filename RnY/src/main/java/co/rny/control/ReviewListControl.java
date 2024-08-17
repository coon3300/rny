package co.rny.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;
import co.rny.common.PageDTO;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		String date = req.getParameter("reviewDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		page = page == null ? "1" : page;
		date = date == null ? sdf.format(new Date()) : date;

		ReviewService rvc = new ReviewServiceImpl();
		ReviewVO rvo = new ReviewVO();

		try {
			rvo.setReviewDate(sdf.parse(date));
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<ReviewVO> list = rvc.reviewList(page);
		req.setAttribute("reviewList", list);
		int totalCnt = rvc.totalCnt();

		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt, 5);
		System.out.println(paging);
		req.setAttribute("page", paging);

		req.getRequestDispatcher("review/reviewList.tiles")//
				.forward(req, resp); // 페이지 재지정.

	}
}
