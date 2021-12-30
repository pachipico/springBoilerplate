<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<main>
  <div class="container px-4 py-5" id="icon-grid">
    <h2 class="pb-2 border-bottom">Member Detail</h2>
	<form action="/product/modify" method="POST">
	      <input type="hidden" name="pno" value="${pvo.pno }">
	    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#bootstrap"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Pno</h4>
	          <p>${pvo.pno }</p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#cpu-fill"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Category</h4>
	          <p><input type="text" id="category" name="category" value="${pvo.category }" class="form-control" readonly ></p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#calendar3"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Product Name</h4>
	          <p><input type="text" id="pname" name="pname" value="${pvo.pname }" class="form-control" readonly ></p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#home"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Price</h4>
	          <p><input type="text" id="price" name="price" value="${pvo.price }" class="form-control" readonly ></p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#speedometer2"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Writer</h4>
	          <p>${pvo.writer }</p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#toggles2"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Description</h4>
	          <p><textarea class="form-control" name="description" id="description" readonly>${pvo.description }</textarea></p>
	        </div>
	      </div>
	       <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#home"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Made By</h4>
	          <p><input type="text" id="madeBy" name="madeBy" value="${pvo.madeBy }" class="form-control" readonly ></p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#speedometer2"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Register At</h4>
	          <p>${pvo.regAt }</p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#speedometer2"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Modified At</h4>
	          <p>${ pvo.modAt == pvo.regAt ? 'not modified yet' : pvo.modAt }</p>
	        </div>
	      </div>
	      <div class="col d-flex align-items-start">
	        <svg class="bi text-muted flex-shrink-0 me-3" width="1.75em" height="1.75em"><use xlink:href="#speedometer2"/></svg>
	        <div>
	          <h4 class="fw-bold mb-0">Read Count</h4>
	          <p>${pvo.readCount }</p>
	        </div>
	      </div>
	    </div>
	    <c:if test="${ses.email eq pvo.writer }">
	    	<button type="button" id="modBtn" class="btn btn-outline-warning">Modify</button>
	    	<a href="/product/remove?pno=${pvo.pno }" class="btn btn-outline-danger">Delete</a>
	    </c:if>
    </form> 
  </div>
</main>
<script src="/resources/js/product.detail.js"></script>
<script type="text/javascript">
let isUp = '<c:out value="${isUp}" />';
if(parseInt(isUp)){
	alert("수정 완료");
}
</script>
<jsp:include page="../common/footer.jsp" />