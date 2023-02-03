<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href='<c:url value="/resources/css/main.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/css/delete.css" />' rel='stylesheet'>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js" />
    </script>
    <script type="text/javascript" src="webjars/popper.js/2.9.3/umd/popper.min.js" />
    </script>
    <link href='<c:url value="/resources/images/tamlogo.png" />' rel='icon'>
    <title>Order</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>
    <div class="container" style="margin-top: 10px;">
        <h2 style="margin-top: 20px; margin-bottom: 20px;">Order Manager</h2>
        <c:if test="${type.equals('orders')}">
            <div class="col-xs-12 col-sm-12 col-md-10">
                <c:if test="${not empty orderList}">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Customer</th>
                                <th scope="col">Address</th>
                                <th scope="col">OrderDate</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}" varStatus="checkout">
                                <tr>
                                    <th scope="row" style="padding-top:15px;">${order.id}</th>
                                    <td style="padding-top:15px;">${order.customerName}</td>
                                    <td style="padding-top:15px;">${order.customerAddress}</td>
                                    <td style="padding-top:15px;">${order.orderDate}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary"
                                            onclick="location.href='cart/view_orderId=${order.id}page1'">View</button>
                                        <a class="btn btn-sm btn-danger" href="#modalDelete${order.id}"
                                            class="trigger-btn" data-toggle="modal" data-id="${order.id}?">Delete</a>
                                    </td>

                                    <div id="modalDelete${order.id}" class="modal fade">
                                        <div class="modal-dialog modal-confirm">
                                            <div class="modal-content">
                                                <div class="modal-header flex-column">
                                                    <div class="icon-box">
                                                        <i class="fal fa-times">&#129409;</i>
                                                    </div>
                                                    <h4 class="modal-title w-100">Delete Order?</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you really want to delete this order of
                                                        "${order.customerName}"?</p>
                                                </div>
                                                <div class="modal-footer justify-content-center">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-danger"
                                                        onclick="location.href='orderlist/delete/${order.id}'">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${orderList.size() == 0}">
                    <br>
                    <div class="alert alert-warning">
                        There is no data, please search again with new keyword... Love <3 </div>
                </c:if>
            </div>
        </c:if>
</body>

</html>