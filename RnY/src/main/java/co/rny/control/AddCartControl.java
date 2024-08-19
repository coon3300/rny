package co.rny.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.CartVO;

public class AddCartControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	CartService cartListService = new CartServiceImpl();
		ObjectMapper objectMapper = new ObjectMapper();
		
		ServletInputStream inputStream = req.getInputStream();
		Map<String,String> map 
			= objectMapper.readValue(inputStream,
					new TypeReference<Map<String,String>>(){});
		
		CartVO cartVO = new CartVO();
		cartVO.setItemNo(Integer.parseInt(map.get("productNo")));
		cartVO.setUserNo(map.get("memberId"));		
		
		// System.out.println(cartListVO);
		String json;
		if(cartListService.insertCartList(cartVO)) {
			json= String.format("{\"%s\":\"%s\"}", "addCart","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "addCart","Faild");
		resp.getWriter().print(json);
    }
}