package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.common.SearchVO;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

public class ReviewItemListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String itemNo = req.getParameter("itemNo");
		String page = req.getParameter("page");
		
		SearchVO search = new SearchVO();
		search.setItemNo(Integer.parseInt(itemNo));
		search.setPage(Integer.parseInt(page));
		
		ReviewService svc = new ReviewServiceImpl();
//		List<ReviewVO> list = svc.replyList(Integer.parseInt(bno));
		List<ReviewVO> list = svc.getReviewsByItemNo(search);
		
		// json문자열.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		resp.getWriter().print(json);

	}

}
