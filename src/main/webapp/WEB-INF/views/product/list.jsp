<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container my-5">
<table class="table table-hover">
  <thead>
    <tr>
      
      <th scope="col">Pno</th>
      <th scope="col">Category</th>
      <th scope="col">Pname</th>
      <th scope="col">Price</th>
      <th scope="col">Read Count</th>
      <th scope="col">Comment Count</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="pvo" varStatus="st">
    <tr>
      <th scope="row">${pvo.pno }</th>
      <td>${pvo.category }</td>
      <td><a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a></td>
      <td>${pvo.price }</td>
      <td>${pvo.readCount }</td>
      <td>${pvo.cmtQty}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>

<jsp:include page="../common/footer.jsp" />