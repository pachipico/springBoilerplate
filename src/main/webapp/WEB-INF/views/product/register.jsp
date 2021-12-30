<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>Register Product</h2>
      <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Your cart</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Product name</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$12</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Second product</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$8</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Third item</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">Promo code</h6>
              <small>EXAMPLECODE</small>
            </div>
            <span class="text-success">−$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total (USD)</span>
            <strong>$20</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </form>
      </div>
      <!-- 회원가입란 -->
      <div class="col-md-7 col-lg-8">
      
        <h4 class="mb-3">Input your information</h4>
        <form  method="post" action="/product/register">
          <div class="row g-3">
          

            <div class="col-12">
              <label for="category" class="form-label">Category</label>
              <input type="text" class="form-control" id="category" name="category" placeholder="Category" required>
              
            </div>
			
			<div class="col-12">
              <label for="pname" class="form-label">Product Name</label>
              <input type="text" class="form-control" id="pname" name="pname" placeholder="Product Name" required>
              
            </div>           
            <div class="col-12">
              <label for="price" class="form-label">Price</label>
              <input type="number" class="form-control" id="price" name="price" placeholder="Price" required>
              
            </div>           
            <div class="col-12">
              <label for="writer" class="form-label">Writer</label>
              <input type="text" class="form-control" id="writer" name="writer" value="${ses.email }"  readonly>
              
            </div>
			<div class="col-12">
              <label for="madeBy" class="form-label">Made By</label>
              <input type="text" class="form-control" id="madeBy" name="madeBy" placeholder="Made By" required>
              
            </div>           
            <div class="col-12">
              <label for="description" class="form-label">Description</label>
              <textarea id="description" class="form-control" name="description"></textarea>
              
            </div>
			
            <!-- <div class="col-md-5">
              <label for="country" class="form-label">Country</label>
              <select class="form-select" id="country" >
                <option value="">Choose...</option>
                <option>United States</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>

            <div class="col-md-4">
              <label for="state" class="form-label">State</label>
              <select class="form-select" id="state" >
                <option value="">Choose...</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>

            <div class="col-md-3">
              <label for="zip" class="form-label">Zip</label>
              <input type="text" class="form-control" id="zip" placeholder="" >
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div> -->
          

          <button class="w-100 btn btn-primary btn-lg my-4" type="submit">Continue to Register</button>
        </form>
      </div>
    </div>
  </main>

</div>

<jsp:include page="../common/footer.jsp" />