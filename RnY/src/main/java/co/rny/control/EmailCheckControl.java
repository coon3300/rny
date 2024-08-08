package co.rny.control;

		import java.io.IOException;
		import java.util.HashMap;
		import java.util.Map;

		import javax.servlet.ServletException;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;

		import com.google.gson.Gson;

		import co.rny.common.Control;
		import co.rny.service.MemberService;
		import co.rny.service.MemberServiceImpl;

		public class EmailCheckControl implements Control {

		@Override
		public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	    resp.setContentType("application/json;charset=utf-8");
	
		String userEmail = req.getParameter("userEmail");
		MemberService svc = new MemberServiceImpl();
        int isAvailableEmail = svc.selectEmail(userEmail);
		System.out.println(isAvailableEmail);


        
        Map<String, Object> result = new HashMap<>();
        
        if (isAvailableEmail < 1) {
            result.put("retCode", "Success");
            result.put("retVal", "ok");
        } else {
            result.put("retCode", "Fail");
            result.put("retVal", "duplicate");
        }
        
        
        Gson gson = new Gson();
        String jsonResult = gson.toJson(result);
        
        resp.getWriter().write(jsonResult);
	}

}