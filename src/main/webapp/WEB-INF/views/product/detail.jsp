<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>Product Detail</h2>
      <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">

        
      </div>
      
<!-- 상품상세정보란 시작 -->
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Product information</h4>
        <form action="/product/modify" method="post">
        <input type="hidden" name="pno" value="${pvo.pno }">
          <div class="row g-3">

            <div class="col-12">
              <label for="email" class="form-label">Writer</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="email" class="form-control" name="writer"
                id="writer" value="${pvo.writer }" readonly>              
              </div>
            </div>
            
            <div class="col-12">
              <label for="regAt" class="form-label">Reg At</label>
              <input type="text" class="form-control" id="regAt" value="${pvo.regAt }" readOnly>              
            </div>
            <div class="col-12">
              <label for="modAt" class="form-label">Mod At</label>
              <input type="text" class="form-control" id="modAt" value="${pvo.modAt }" readOnly>              
            </div>
            <div class="col-12">
              <label for="readCount" class="form-label">Read Count</label>
              <input type="text" class="form-control" id="readCount" value="${pvo.readCount }" readOnly>              
            </div>
            <div class="col-12">
              <label for="cmtQty" class="form-label">Comment Qty.</label>
              <input type="text" class="form-control" id="cmtQty" value="${pvo.cmtQty }" readOnly>              
            </div>
            
            <div class="col-12">
              <label for="pname" class="form-label">Product Name</label>
              <input type="text" class="form-control" name="pname"
               id="pname" placeholder="Product Name" value="${pvo.pname }" readOnly>              
            </div>

            <div class="col-12">
              <label for="desc" class="form-label">Description</label>
              <textarea class="form-control" name="description" readOnly
               id="desc" placeholder="Description">${pvo.description }</textarea>              
            </div>

            <div class="col-md-5">
              <label for="madeBy" class="form-label">Made By</label>
              <c:set var="madeby" value="${pvo.madeBy }"/>
              <select class="form-select" name="madeBy" id="madeBy"
               required disabled>
                <option value="">Choose...</option>
                <option value="us" ${madeby eq 'us' ? 'selected' : ''}>United States</option>
                <option value="ko" ${madeby eq 'ko' ? 'selected' : ''}>Korea</option>
                <option value="cn" ${madeby eq 'cn' ? 'selected' : ''}>China</option>
                <option value="eu" ${madeby eq 'eu' ? 'selected' : ''}>European Union</option>
              </select>
            </div>

            <div class="col-md-4">
              <label for="cate" class="form-label">Category</label>
              <c:set var="cate" value="${pvo.category }"/>
              <select class="form-select" name="category" id="category"
               required disabled>
                <option value="">Choose...</option>
                <option value="Clothes" ${cate eq 'Clothes' ? 'selected' : ''}>Clothes</option>
                <option value="Electronic" ${cate eq 'Electronic' ? 'selected' : ''}>Electronic</option>
                <option value="Food" ${cate eq 'Food' ? 'selected' : ''}>Food</option>
                <option value="Health" ${cate eq 'Health' ? 'selected' : ''}>Health</option>
                <option value="Media" ${cate eq 'Media' ? 'selected' : ''}>Media</option>
              </select>
            </div>

            <div class="col-md-3">
              <label for="price" class="form-label">Price</label>
              <input type="text" class="form-control" name="price"
               id="price" placeholder="" value="${pvo.price }" required readOnly>
            </div>

        <c:if test="${ses.email eq pvo.writer }">
    	   	<button type="button" id="modBtn" class="btn btn-outline-warning">MOD</button>
    		<button type="button" id="delBtn" class="btn btn-outline-danger">DEL</button>
	    </c:if>
        </div>
        </form>
      </div>
      <div id="cmtForm">
      		<input type="hidden" name="pno" value="${pvo.pno }">
      		<input type="hidden" name="writer" value="${ses.email }">
      		<textarea class="form-control" id="cmtContent" name="content"></textarea>
      		<button type="button" id="cmtAddBtn" class="btn btn-sm btn-primary my-2">add comment</button>
      </div>
            	<table class="table">
  <thead>
    <tr>
      <th scope="col">Nickname</th>
      <th scope="col">reg at</th>
      <th scope="col">content</th>
      <th scope="col">buttons</th>
    </tr>
  </thead>
  <tbody id="cmtContainer">
  <!-- list를 가져올것인지 자바스크립트로 뿌릴 것인지? -->
    <tr>
      <th scope="row">abc</th>
      <td>2021-12-31 21:32</td>
      <td>i like this!</td>
      <td>
      <button id="cmtEditBtn" class="btn btn-sm btn-outline-warning">edit</button>
      <button id="cmtDelBtn" class="btn btn-sm btn-outline-danger">delete</button>
</td>
    </tr>
    
  </tbody>
</table>
      
    </div>
  </main>
</div>
<form action="/product/remove" method="post" id="delForm">
	<input type="hidden" name="pno" value="${pvo.pno }">
</form>
<script src="/resources/js/product.detail.js"></script>
<script>
let isMod = '<c:out value="${isMod}"/>';
if (parseInt(isMod)) {
	alert('상품 수정 성공~');
}
</script>
<jsp:include page="../common/footer.jsp" />