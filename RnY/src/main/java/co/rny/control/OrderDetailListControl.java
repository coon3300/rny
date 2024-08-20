package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class OrderDetailListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8"); // 내용 중 한글이 있다면 utf-8로 변환해야함.
		OrderService ovc = new OrderServiceImpl();
		String orderNo = req.getParameter("orderNo");
		
		List<OrderVO> list = ovc.myOrderDetailList(Integer.parseInt(orderNo));

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // 목록을 JSON으로 변환

		resp.getWriter().print(json);

		
	}

}
