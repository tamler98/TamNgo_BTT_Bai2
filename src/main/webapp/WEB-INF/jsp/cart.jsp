<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href='<c:url value="/resources/css/main.css" />' rel='stylesheet'>
    <link href='<c:url value="/resources/css/delete.css" />' rel='stylesheet'>
    <script type="text/javascript" src="/resources/js/time.js"></script>
    <link href='<c:url value="/resources/images/logocat.png" />' rel='icon'>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js" />
    </script>
    <script type="text/javascript" src="webjars/popper.js/2.9.3/umd/popper.min.js" />
    </script>
    <title>index</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>

    <div class="container">
        <h2 style="margin-top: 20px;">Your Cart Item</h2>
        <h6 style="opacity: 0.4; color: black; margin-bottom: 20px;">Please Check Carefully Before Complete Your
            Order!</h6>
        <div class="col-xs-12 col-sm-12 col-md-10">
            <c:if test="${not empty cartItem}">
                <div class="rows">
                    <div class="col-sm-9">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="item" items="${cartItem}">
                                    <form action="cart/update/${item.getProductEntity().getId()}" method="post">
                                        <input type="hidden" name="id" value="${item.productEntity.id}" />
                                        <tr>
                                            <td>${item.productEntity.id }</td>
                                            <td>${item.productEntity.name }</td>
                                            <td>${item.productEntity.price}</td>
                                            <td><input name="quantity" value="${item.quantity}"
                                                    onblur="this.form.submit()" style="width: 50px;"></td>
                                            <td>${item.productEntity.price * item.quantity}</td>
                                            <td><a class="btn btn-primary btn-sm" href="#delCart${item.productEntity.id}"
                                                    class="trigger-btn" data-toggle="modal">Remove</a></td>

                                            <div id="delCart${item.productEntity.id}" class="modal fade">
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
                                                            <p>Do you want to delete item "${item.productEntity.name}"?</p>
                                                        </div>
                                                        <div class="modal-footer justify-content-center">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-danger"
                                                                onclick="location.href='cart/remove/${item.productEntity.id}'">Delete</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="total" style="display: flex; flex-direction: row; padding-left: 56%;">
                            <div class="total_head" style="font-weight: bold;">Total:</div>
                            <div class="total_value" style="margin-left: 102px; font-weight: bold;">${total}</div>
                        </div>
                        <hr />
                        <a class="btn btn-primary" href="cart/clear">Clear All
                            Cart</a> <a class="btn btn-primary" href="/TamNgo_BTT_Bai2/">Add
                            more</a>
                            <a class="btn btn-info" style="color: white;" href="cart/checkout" >Check Out</a>
                        <a class="btn btn-info" style="color: white;" href="#checkOut" class="trigger-btn"
                            data-toggle="modal">Check Out</a>

                        <div class="modal fade" id="checkOut">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Customer Information | Check Out</h4>
                                        <button type="button" class="btn-close" aria-label="Close"
                                            data-dismiss="modal"></button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form:form action="cart/checkout" method="POST" modelAttribute="order">
                                            <div class="form-group">
                                                <label class="control-label">Customer (*)</label>
                                                <input name="customerName" type="text" class="form-control"
                                                    placeholder="Customer" />
                                            <small style="color: red;">
                                                <form:errors path="customerName" class="text-error" />
                                            </small>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Address (*)</label>
                                                <input name="customerAddress" type="text" class="form-control"
                                                    placeholder="Address" required="true" />
                                                <small style="color: red;">
                                                    <form:errors path="customerName" class="text-error" />
                                                </small>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">OrderDate (*)</label>
                                                <input name="orderDate" type="date" id="myDate" class="form-control"
                                                    value="2023-01-27" />
                                            </div>
                                            <br>
                                            <div class="footer" style="display:flex; justify-content: center;">
                                                <button class="btn btn-primary" type="submit" style="width: 100%">Check
                                                    Out</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${cartItem.size() == 0}">
                <br>
                <div class="alert alert-warning">
                    There is no data, please search again with new keyword... Love <3 </div>
            </c:if>
        </div>
</body>

</html>
