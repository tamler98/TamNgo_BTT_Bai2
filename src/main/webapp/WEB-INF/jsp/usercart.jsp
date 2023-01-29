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
    <title>Customer Shopping Cart</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href='<c:url value="/resources/images/logocat.png" />' rel='icon'>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>
    <div class="container">
        <h2 style="margin-top: 20px;">${customer.getCustomerName()} Cart</h2>
        <div class="customer" style="display: flex; flex-direction: row; margin-bottom: 20px">
            <lable style="margin-right: 10px;">Name:</lable>
            <div class="name_text" style="color:blue; font-weight: bold;">${customer.getCustomerName()}</div>
            <lable style="margin-left: 160px; margin-right: 10px;">Address:</lable>
            <div class="address_text" style="color:blue; font-weight: bold;">${customer.customerAddress}</div>
            <lable style="margin-left: 160px; margin-right: 10px;">Order Date:</lable>
            <div class="orderDate_text" style="color:blue; font-weight: bold;">${customer.orderDate}</div>
        </div>
        <h6 style="opacity: 0.4; color: black; margin-bottom: 20px;">Please Check Carefully Before Complete Your Order!
        </h6>
        <div class="col-xs-12 col-sm-12 col-md-10">
            <c:if test="${not empty orderDetails}">
                <div class="rows">
                    <div class="col-sm-9">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Amount</>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="detail" items="${orderDetails}">
                                    <form action="cart/update/${item.productId}" method="post">
                                        <input type="hidden" name="id" value="${detail.id}" />
                                        <tr>
                                            <td>${detail.id }</td>
                                            <td>${detail.product.name }</td>
                                            <td><input name="quantity" value="${detail.quantity}"
                                                    onblur="this.form.submit()" style="width: 50px;"></td>
                                            <td>${detail.product.price }</td>
                                            <td>${detail.product.price*detail.quantity}</td>
                                            <td><a class="btn btn-primary btn-sm" href="#delCart${detail.id}"
                                                    class="trigger-btn" data-toggle="modal">Remove</a></td>

                                            <div id="delCart${detail.id}" class="modal fade">
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
                                                            <p>Do you want to delete item "${detail.product.name}"?</p>
                                                        </div>
                                                        <div class="modal-footer justify-content-center">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-danger"
                                                                onclick="location.href='removeOrderDetail${detail.id}'">Delete</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <hr />
                        <a class="btn btn-primary" href="/TamNgo_BTT_Bai2/">Add
                            more</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${orderDetails.size() == 0}">
                <br>
                <div class="alert alert-warning">
                    There is no data, please search again with new keyword... Love <3 </div>
            </c:if>
        </div>
    </div>
</body>

</html>
