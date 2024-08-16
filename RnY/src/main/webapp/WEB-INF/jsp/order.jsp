<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Order Confirmation</title>
<link href="css/yerim/order/order.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>주문 확인</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>개수</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${logOrder}">
                    <tr>
                        <td>${order.itemName}</td>
                        <td>${order.itemPrice}원</td>
                        <td>${order.cartCnt}</td>
                        <td>${order.itemPrice}원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h3>총 결제 금액: ${totalAmount}원</h3>
        <a href="main.do" class="btn btn-primary">홈으로 돌아가기</a>
    </div>
</body>
</html>
