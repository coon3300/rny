package co.rny.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.rny.common.Control;
import co.rny.service.CartService;
import co.rny.service.CartServiceImpl;
import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.CartVO;
import co.rny.vo.OrderVO;

public class OrderControl implements Control {
    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("logid");

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        if (id == null) {
            out.println("<script language='javascript'>");
            out.println("alert('주문은 로그인 후 사용가능합니다!')");
            out.println("location.href='main.do';");
            out.println("</script>");
            return;
        }

        // Handle cart update if request parameters are provided
        String updateCartNo = req.getParameter("cartNo");
        String updateCartCountStr = req.getParameter("cartCount");

        if (updateCartNo != null && updateCartCountStr != null) {
            try {
                int updateCartCount = Integer.parseInt(updateCartCountStr);
                CartService cartService = new CartServiceImpl();

                // Retrieve the CartVO object for the specific cart item
                CartService cartService = new CartServiceImpl();
                CartVO cart = cartService.getCartItem(id, updateCartNo);

                if (cart != null) {
                    cart.setCartCount(updateCartCount);
                    cartService.updateCartCount(cart);
                }

                // Redirect to the cart page to reflect updates
                resp.sendRedirect("cart.do");
                return;
            } catch (NumberFormatException e) {
                out.println("<script language='javascript'>");
                out.println("alert('유효하지 않은 수량입니다!')");
                out.println("location.href='cart.do';");
                out.println("</script>");
                return;
            }
        }

        // Retrieve cart information
        CartService cartService = new CartServiceImpl();
        List<CartVO> cartlist = cartService.cartList(id);

        // Order processing
        String orderName = req.getParameter("orderName");
        String orderAdd = req.getParameter("orderAdd");
        String orderPhone = req.getParameter("orderPhone");
        String orderEmail = req.getParameter("orderEmail");
        String orderMessage = req.getParameter("orderMessage");
        String orderMessageText = req.getParameter("orderMessageText");

        if (orderName != null && orderAdd != null && orderPhone != null && orderEmail != null) {
            OrderService orderService = new OrderServiceImpl();

            OrderVO order = new OrderVO();
            order.setUserNo(id);
            order.setOrderName(orderName);
            order.setOrderAddress(orderAdd);
            order.setOrderPhone(orderPhone);
            order.setOrderEmail(orderEmail);
            order.setOrderMessage(orderMessage);
            order.setOrderMessageText(orderMessageText);
            order.setCartItems(cartlist);  // Assume OrderVO has a setCartItems method

            boolean success = orderService.ordered(order);

            if (success) {
                // Order completion - redirect to order confirmation page
                req.setAttribute("logCart", cartlist);
                req.getRequestDispatcher("RnY/orderConfirmation.tiles").forward(req, resp);
            } else {
                out.println("<script language='javascript'>");
                out.println("alert('주문 처리 중 오류가 발생했습니다!')");
                out.println("location.href='cart.do';");
                out.println("</script>");
            }
            return;
        }

        // If no order processing, just forward to order page
        req.setAttribute("logCart", cartlist);
        req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);
    }
}
