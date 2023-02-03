<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href='<c:url value="/resources/css/delete.css" />' rel='stylesheet'>
    <script type="text/javascript" src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.6.0/jquery.js" />
    </script>
    <link href='<c:url value="/resources/images/logocat.png" />' rel='icon'>
    <title>Product</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="header.jsp" />

<body>
    <div class="container" style="margin-top: 20px;">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6" style="width:100%;">
                <form:form action="search" method="get">
                    <div class="input-group">
                        <input name="searchInput" type="text" class="form-control" placeholder="Search by name..." />
                        <span class="input-group-btn">
                            <button class="btn btn-outline-primary" style="height: 38px; type=" submit">Search</button>
                        </span>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="footter" style="width: 100%;display: flex; justify-content: left;">
            <a class="btn btn-primary" href="#myModalAddProduct" class="trigger-btn" data-toggle="modal">Add Product</a>
        </div>

        <div class="modal fade" id="myModalAddProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Product</h4>
                        <button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form:form action="newProducts" method="POST" modelAttribute="product">
                            <div class="form-group">
                                <label class="control-label">Name (*)</label>
                                <input name="name" type="text" class="form-control" placeholder="Name"
                                    required="true" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Price (*)</label>
                                <input name="price" type="number" class="form-control" placeholder="Price"
                                    required="true" />
                            </div>
                            <br>
                            <div class="footer" style="display:flex; justify-content: center;">
                                <button class="btn btn-primary" type="submit" style="width: 100%">Add</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-10" style="width:100%;">
            <c:if test="${not empty productList}">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:5%;">ID</th>
                            <th scope="col" style="width:45%;">Name</th>
                            <th scope="col" style="width:20%;">Price</th>
                            <th scope="col" style="width:30%;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${productList}" varStatus="index">
                            <tr>
                                <th scope="row" style="padding-top:20px;">${product.id}</th>
                                <td style="padding-top:20px;">${product.name}</td>
                                <td style="padding-top:20px;">${product.price}</td>
                                <td>
                                    <a class="btn btn-info" href="#addToCart${product.id}" class="trigger-btn"
                                        style="color:white;" data-toggle="modal">Add to
                                        Cart</a>

                                    <div id="addToCart${product.id}" class="modal fade">
                                        <div class="modal-dialog modal-confirm">
                                            <div class="modal-content">
                                                <div class="modal-header flex-column">
                                                    <div class="icon-box">
                                                        <i class="fal fa-times">&#129728;</i>
                                                    </div>
                                                    <h4 class="modal-title w-100">Are you sure?</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you want to add "${product.name}" to cart?</p>
                                                </div>
                                                <div class="modal-footer justify-content-center">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-info"
                                                        onclick="location.href='cart/add/${product.id}'">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        </div>

        <a class="btn btn-warning" href="#edit${product.id}" class="trigger-btn" data-toggle="modal">Edit</a>


        <div class="modal fade" id="edit${product.id}">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Product</h4>
                        <button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">

                        <form:form action="edit/updateProduct/${product.id}" method="POST" modelAttribute="product">
                            <div class="form-group">
                                <label class="control-label">ID</label>
                                <input value="${product.id}" path="id" type="text" class="form-control" id="id"
                                    placeholder="ID" disabled="true" />
                                <hidden path="id" />
                            </div>

                            <div class="form-group">
                                <label class="control-label">Name (*)</label>
                                <input value="${product.name}" path="newName" name="newName" type="text"
                                    class="form-control" placeholder="Name" required="true" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Price (*)</label>
                                <input value="${product.price}" path="newPrice" name="newPrice" type="number"
                                    class="form-control" placeholder="Price" required="true" />
                            </div>
                            <br>
                            <div class="footer" style="display:flex; justify-content: center;">
                                <button class="btn btn-primary" type="submit" style="width: 100%">Save</button>
                            </div>
                        </form:form>
                    </div>

                </div>
            </div>

        </div>


        <a class="btn btn-danger" href="#myModalDelete${product.id}" class="trigger-btn" data-toggle="modal"
            data-name="${product.id}?">Delete</a>
        </td>

        <div id="myModalDelete${product.id}" class="modal fade">
            <div class="modal-dialog modal-confirm">
                <div class="modal-content">
                    <div class="modal-header flex-column">
                        <div class="icon-box">
                            <i class="fal fa-times">&#9749;</i>
                        </div>
                        <h4 class="modal-title w-100">Are you sure?</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Do you really want to delete product "${product.name}"? This process
                            cannot
                            be undone.</p>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger"
                            onclick="location.href='delete/${product.id}'">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        </tr>
        </c:forEach>
        </tbody>
        </table>
        </c:if>
        <c:if test="${productList.size() == 0}">
            <br>
            <div class="alert alert-warning">
                There is no data, please search again with new keyword... Love <3 </div>
        </c:if>

    </div>
</body>

</html>