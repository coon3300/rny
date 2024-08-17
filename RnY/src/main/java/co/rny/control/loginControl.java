package co.rny.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.service.MemberService;
import co.rny.service.MemberServiceImpl;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.service.WishService;
import co.rny.service.WishServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.MemberVO;
import co.rny.vo.OrderVO;
import co.rny.vo.WishVO;

public class loginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		MemberService svc = new MemberServiceImpl();
		MemberVO mem = svc.loginCheck(id, pw);
		String uno = svc.userCheck(id);

		HttpSession session = req.getSession();

		// ***예림***
		String nick = svc.userNick(id);
		String name = svc.userName(id);
		WishService wsv = new WishServiceImpl();
		List<WishVO> wishlist = wsv.wishheart(id);
		OrderService osv = new OrderServiceImpl();
		//List<OrderVO> ordering = osv.listOrder(id);
		CartService csv = new CartServiceImpl();
		List<CartVO> cartIn = csv.cartList(id);
		// ***예림***

		// ***은찬***
		//session.setAttribute("responsibility", mem.getResponsibility()); // 관리자만 댓글 적용

		// 세션객체(attribute)
		session.setAttribute("logid", id);
		session.setAttribute("userNo", uno);
		session.setMaxInactiveInterval(30 * 60);
		// ***예림***
		session.setAttribute("logNick", nick);
		session.setAttribute("logName", name);
		session.setAttribute("logWish", wishlist);
		// session.setAttribute("logOrder", ordering);
		// session.setAttribute("logCart", cartIn);
		// session.setAttribute("order", orderlist);
		// session.setAttribute("logWish", wishlist);
		// session.setAttribute("logOrder", ordering);
		// session.setAttribute("logCart", cartIn);
		// session.setAttribute("order", orderlist);
		// !
		Gson gson = new GsonBuilder().create();
		// gson.toJson(null)
		Map<String, Object> map = new HashMap<>();

		if (mem == null) { // 로그인실패
			map.put("recCode", "Fail");
			map.put("retVal", null);
		} else if (mem.getResponsibility().equals("user")) { // 로그인 성공인데 일반회원인경우
			map.put("recCode", "Success");
			map.put("retVal", "user");
		} else if (mem.getResponsibility().equals("admin")) { // 로그인 성공인데 관리자인경우
			map.put("recCode", "Success");
			map.put("retVal", "admin");
		}
		resp.getWriter().print(gson.toJson(map));

	}

}

