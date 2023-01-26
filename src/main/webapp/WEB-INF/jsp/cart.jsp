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
    <title>index</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>

	<div class="container">
		<h2>Your Cart Item</h2>
		<h6>Please Check Carefully Before Complete Your Order!</h6>
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
							<form action="/shopping-cart/update" method="post">
								<input type="hidden" name="id" value="${item.productId}" />
							<tr>
								<td>${item.productId }</td>
								<td>${item.name }</td>
								<td>${item.price}</td>
								<td><input name="qty" value="${item.quantity}"
									onblur="this.form.submit()" style="width: 50px;"></td>
								<td>${item.price*item.quantity}</td>
								<td><a class="btn btn-primary btn-sm"
									href="#delCart${item.productId}" class="trigger-btn" data-toggle="modal">Remove</a></td>

								<div id="delCart${item.productId}" class="modal fade">
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
                                                                                    <p>Do you want to delete item "${item.name}"?</p>
                                                                                </div>
                                                                                <div class="modal-footer justify-content-center">
                                                                                    <button type="button" class="btn btn-secondary"
                                                                                        data-dismiss="modal">Cancel</button>
                                                                                    <button type="button" class="btn btn-danger"
                                                                                        onclick="location.href='cart/remove/${item.productId}'">Delete</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

							</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
				<div class="total" style="display: flex; flex-direction: row; padding-left: 59%;">
                    <div class="total_head" style="font-weight: bold;">Total:</div>
                    <div class="total_value" style="margin-left: 97px; font-weight: bold;">${total}</div>
                </div>
				<hr />
				<a class="btn btn-primary btn-sm" href="cart/clear">Clear All
					Cart</a> <a class="btn btn-primary btn-sm" href="/TamNgo_BTT_Bai2/">Add
					more</a>
			</div>
		</div>

	</div>
</body>

</html>