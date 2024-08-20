package co.rny.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.rny.common.Control;

public class LineFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		LineService svc = new LineServiceImpl();
//
//    	int currval = svc.lineCurrval();
//    	
//    	req.setAttribute("currval", currval);
    	
    	req.getRequestDispatcher("RnY/lineForm.tiles").forward(req, resp);
	}

}
