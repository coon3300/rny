package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class OrderControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("logid");
        String cartCount = req.getParameter("cartCount");
        OrderVO ovo = new OrderVO();
        ovo.setCartCnt(Integer.parseInt(cartCount));
       
        OrderService osv = new OrderServiceImpl();
        
        
        if (id == null) {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>");
            out.println("alert('주문은 로그인 후 사용가능합니다!')");
            out.println("location.href='main.do';");
            out.println("</script>");
            return;
        }
        
        List<OrderVO> cartItems = osv.getCartItems(id);
        
//        String totalAmountStr = req.getParameter("totalAmount");
//        if (totalAmountStr == null || totalAmountStr.isEmpty()) {
//            resp.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = resp.getWriter();
//            out.println("<script language='javascript'>");
//            out.println("alert('총 결제금액이 누락되었습니다.');");
//            out.println("history.back();");
//            out.println("</script>");
//            return;
//        }
        
        
        
//        int totalAmount = Integer.parseInt(totalAmountStr);
//
//
//        if (cartItems == null || cartItems.isEmpty()) {
//            resp.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = resp.getWriter();
//            out.println("<script language='javascript'>");
//            out.println("alert('장바구니에 주문할 상품이 없습니다.');");
//            out.println("history.back();");
//            out.println("</script>");
//            return;
//        }
        
        
        
//        for (OrderVO item : cartItems) {
//            item.setOrderPrice(item.getItemPrice() * item.getOrderCnt());
//            orderService.saveOrder(item);
//        }
        
        req.setAttribute("logOrder", cartItems);
       // req.setAttribute("logOrderTotalAmount", totalAmount);
        req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);
    }
}
