<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:url value="/cart/" var="userListUrl"/>
<c:set var="currentPage" value="${userPage.number}"/>
<c:set var="totalPages" value="${userPage.totalPages}"/>

<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
      <spring:url value="${userListUrl}" var="previousPageUrl">
        <spring:param name="page" value="${currentPage - 1}"/>
      </spring:url>
      <a class="page-link" href="${previousPageUrl}" tabindex="-1">Previous</a>
    </li>
    <c:forEach var="i" begin="0" end="${totalPages - 1}">
      <spring:url value="${userListUrl}" var="pageUrl">
        <spring:param name="page" value="${i}"/>
      </spring:url>
      <li class="page-item ${currentPage == i ? 'active' : ''}">
        <a class="page-link" href="${pageUrl}">${i + 1}</a>
      </li>
    </c:forEach>
    <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
      <spring:url value="${userListUrl}" var="nextPageUrl">
        <spring:param name="page" value="${currentPage + 1}"/>
      </spring:url>
      <a class="page-link" href="${nextPageUrl}">Next</a>
    </li>
  </ul>
</nav>