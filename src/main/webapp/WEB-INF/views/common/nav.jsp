<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="/product/list" class="nav-link px-2 text-white">Products</a></li>
          <c:if test="${!empty ses }">
          	<li><a href="/product/register" class="nav-link px-2 text-white">Register</a></li>
          </c:if>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
          <li><a href="#" class="nav-link px-2 text-white">About</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
        <c:choose>
			<c:when test="${empty ses }">
		          <a href="/member/login"  class="btn btn-outline-light me-2">Login</a>
		          <a href="/member/register" class="btn btn-warning">Sign-up</a>
			  	
			</c:when>        
			<c:otherwise>
			  <c:choose>
			  	<c:when test="${ses.grade ge 50 }">
			  	<a href="/member/list"  class="btn btn-outline-light me-2">Member List</a>
			  	</c:when>
			  	<c:otherwise>
				<a href="/member/detail?email=${ses.email }"  class="btn btn-outline-light me-2">${ses.nickName}(${ses.email })</a>
			  	</c:otherwise>
			  </c:choose>
				<a href="/member/logout" class="btn btn-warning">Log-Out</a>		
			</c:otherwise>
        </c:choose>
        </div>
      </div>
    </div>
  </header>