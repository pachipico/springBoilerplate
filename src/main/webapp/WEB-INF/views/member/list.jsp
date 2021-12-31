<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="container my-5">
<table class="table table-hover">
  <thead>
    <tr>
      
      <th scope="col">Email</th>
      <th scope="col">NickName</th>
      <th scope="col">RegAt</th>
      <th scope="col">Last Login</th>
      <th scope="col">grade</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="mvo" varStatus="st">
    <tr>
      <th scope="row">${mvo.email }</th>
      <td>${mvo.nickName }</td>
      <td>${mvo.regAt }</td>
      <td>${mvo.lastLogin }</td>
      <td><input type="number" name="grade" class="form-control w-25 d-inline" value="${mvo.grade }">
      <button type="button" data-email="${mvo.email }" class="btn  btn-outline-danger grade">E</button>
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>
<script src="/resources/js/member.list.js"></script>
<jsp:include page="../common/footer.jsp" />