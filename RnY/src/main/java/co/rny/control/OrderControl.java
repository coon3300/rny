package co.rny.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.rny.common.Control;

public class OrderControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 요청 파라미터 읽기
        String userNo = req.getParameter("userNo");
        String grandTotal = req.getParameter("grandTotal");
        String shippingCost = req.getParameter("shippingCost");
        String totalAmount = req.getParameter("totalAmount");

        // 상품 정보 읽기
        String itemNosStr = req.getParameter("itemNo");
        String itemNamesStr = req.getParameter("itemName");
        String itemPricesStr = req.getParameter("itemPrice");
        String quantitiesStr = req.getParameter("quantity");

        // 문자열을 '/'로 분리하여 배열로 변환
        String[] itemNos = itemNosStr != null ? itemNosStr.split("/") : new String[0];
        String[] itemNames = itemNamesStr != null ? itemNamesStr.split("/") : new String[0];
        String[] itemPrices = itemPricesStr != null ? itemPricesStr.split("/") : new String[0];
        String[] quantities = quantitiesStr != null ? quantitiesStr.split("/") : new String[0];

        // 요청 어트리뷰트 설정
        req.setAttribute("userNo", userNo);
        req.setAttribute("grandTotal", grandTotal);
        req.setAttribute("shippingCost", shippingCost);
        req.setAttribute("totalAmount", totalAmount);

        // 배열을 List로 변환
        List<Map<String, String>> itemList = new ArrayList<>();
        int length = Math.min(Math.min(itemNos.length, itemNames.length), Math.min(itemPrices.length, quantities.length));
        for (int i = 0; i < length; i++) {
            Map<String, String> item = new HashMap<>();
            item.put("itemNo", itemNos[i]);
            item.put("itemName", itemNames[i]);
            item.put("itemPrice", itemPrices[i]);
            item.put("quantity", quantities[i]);
            itemList.add(item);
        }

        req.setAttribute("itemList", itemList);

        // JSP로 포워딩
        req.getRequestDispatcher("RnY/order.tiles").forward(req, resp);
    }
}