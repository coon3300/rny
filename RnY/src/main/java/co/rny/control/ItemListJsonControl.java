package co.rny.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.ItemService;
import co.rny.service.ItemServiceImpl;
import co.rny.vo.ItemVO;

public class ItemListJsonControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		ItemService svc = new ItemServiceImpl();
		
		int lineNo = Integer.parseInt(req.getParameter("lineNo"));

		List<ItemVO> list = svc.itemList(lineNo);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		String json = gson.toJson(list);
		
		resp.getWriter().print(json);
	}

}
