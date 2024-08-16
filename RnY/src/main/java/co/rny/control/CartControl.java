package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.vo.CartVO;

public class CartControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 세션에서 사용자 ID를 가져옵니다.
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("logid");

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        // 로그인이 필요한 경우
        if (id == null) {
            out.println("<script language='javascript'>");
            out.println("alert('장바구니는 로그인 후 사용가능합니다!')");
            out.println("location.href='main.do';");
            out.println("</script>");
            return;
        }

        // CartService를 이용해 장바구니 업데이트
        CartService cartService = new CartServiceImpl();

        // 모든 파라미터를 읽어와서 cartNo와 수량을 처리합니다.
        Enumeration<String> parameterNames = req.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("quantity_")) {
                String itemNo = paramName.substring("quantity_".length());
                String quantityStr = req.getParameter(paramName);

                int quantity = 1; // 기본값
                try {
                    quantity = Integer.parseInt(quantityStr);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                // CartVO 객체를 생성하여 서비스 호출
                CartVO cartVO = new CartVO();
                cartVO.setItemNo(Integer.parseInt(itemNo));
                cartVO.setCartCnt(quantity);
                cartService.updateCartCount(cartVO);
            }
        }

        // 장바구니 페이지로 리디렉션
        req.getRequestDispatcher("RnY/cart.tiles").forward(req, resp);
    }
}
