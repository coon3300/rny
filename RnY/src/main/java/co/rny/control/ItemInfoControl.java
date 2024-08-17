package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ItemVO;
import co.rny.vo.ReviewVO;

public class ItemInfoControl extends LineControl {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ItemService svc = new ItemServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl(); // 리뷰 서비스 추가

		int itemNo = Integer.parseInt(req.getParameter("itemNo"));

		ItemVO ivo = svc.itemSelected(itemNo);

		List<ItemVO> list = svc.itemInfoRelated(itemNo);
		List<ReviewVO> reviewList = reviewService.getReviewsByItemNo(itemNo); // 리뷰 목록 가져오기

		req.setAttribute("ivo", ivo);
		req.setAttribute("itemList", list);
		req.setAttribute("reviewList", reviewList); // 리뷰 목록전달

		req.getRequestDispatcher("RnY/itemInfo.tiles").forward(req, resp);
	}

}
