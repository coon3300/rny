package co.rny.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;

public class OrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 1. form 안에 있는 input의 name으로 받아오면서 변수로 지정하기
		String userNo = req.getParameter("userNo");
		String cartNos = req.getParameter("cartNos");
		String itemNos = req.getParameter("itemNos");
		String itemPrices = req.getParameter("itemPrices");
		String itemNames = req.getParameter("itemNames");
		String itemImages = req.getParameter("itemImages");
		String quantities = req.getParameter("quantities");
		Map<String, String[]> paramMap = req.getParameterMap();
		for(Map.Entry<String, String[]> entry : paramMap.entrySet()) {
			String paramNm = entry.getKey();
			String[] paramValues = entry.getValue();
			System.out.println("paramNm : " + paramNm + String.join(", ", paramValues));
		}
		
		// 2. 받아온 값을 orderList.jsp 로 값 보내기

		req.setAttribute("cartNos", cartNos); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("itemNos", itemNos); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("itemPrices", itemPrices); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("itemNames", itemNames); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("itemImages", itemImages); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("quantities", quantities); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값

		req.getRequestDispatcher("RnY/orderList.tiles").forward(req, resp);

	}

}
