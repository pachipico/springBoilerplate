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
        <input type="hidden" name="ses" value="${ses.email }">
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
      <c:if test="${not empty ses }">
      <div class="input-group">
      	  <span class="input-group-text" id="cmtWriter">${ses.email }</span>
		  <input type="text" class="form-control" id="cmtText">
		  
		  <button class="btn btn-outline-primary" id="cmtPostBtn" type="button">Add Comment</button>
		</div>
      </c:if>
		<!-- <table id="cmtList">
			
		</table> -->
		<ul class="list-group list-group-flush " id="cmtListArea">
  			<li class="list-group-item d-flex justify-content-between align-items-center">
  			  <div class="ms-2 me-auto">
    		  <div class="fw-bold">writer</div>
   			   Content for list item
 		      </div>
    		  <span class="badge bg-primary rounded-pill">modAt</span>
  			</li>
  		</ul>
  		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">${ses.email }</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	 <div class="input-group">
		      	 	 
			 		 <input type="text" class="form-control" id="cmtModText">
					 <button class="btn btn-outline-primary" id="cmtModBtn" type="button">Modify Comment</button>
				</div>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" id="modalClose" data-bs-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>
    <%--   <c:if test="${not empty ses.email }">
      <div id="cmtForm">
      		<input type="hidden" name="pno" value="${pvo.pno }">
      		<input type="hidden" name="writer" value="${ses.email }">
      		<textarea class="form-control" id="cmtContent" name="content"></textarea>
      		<button type="button" id="cmtAddBtn" class="btn btn-sm btn-primary my-2">add comment</button>
      </div>
      </c:if>
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

  </tbody>
</table> --%>
      
    </div>
  </main>
</div>
<form action="/product/remove" method="post" id="delForm">
	<input type="hidden" name="pno" value="${pvo.pno }">
</form>

<script type="text/javascript">
const pnoVal = document.querySelector("input[name=pno]").value;
const ses = '<c:out value="${ses.email}"/>'
</script>
<script src="/resources/js/product.detail.js"></script>
<script src="/resources/js/product.comment.js"></script>
<script>
let isMod = '<c:out value="${isMod}"/>';
if (parseInt(isMod)) {
	alert('상품 수정 성공~');
}
getCommentList(pnoVal);
</script>
<jsp:include page="../common/footer.jsp" />