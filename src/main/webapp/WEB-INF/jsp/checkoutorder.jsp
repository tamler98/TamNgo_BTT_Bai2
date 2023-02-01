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
        <form:form action="checkout" method="POST" modelAttribute="order">
            <div class="form-group">
                <label class="control-label">Customer (*)</label>
                <form:input path="customerName" type="text" class="form-control"
                    placeholder="Customer" />
            <small style="color: red;">
                <form:errors path="customerName" class="text-error" />
            </small>
            </div>
            <div class="form-group">
                <label class="control-label">Address (*)</label>
                <form:input path="customerAddress" type="text" class="form-control"
                    placeholder="Address"/>
                <small style="color: red;">
                    <form:errors path="customerAddress" class="text-error" />
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
</body>

</html>
