<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.accesories"%>
<%@ page import="models.Cart"%>
<%@ page import="models.User"%>

<%
double subTotal = 0;
User user = (User) session.getAttribute("user");
ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<jsp:include page="/includes/header.jsp" />
<style>
.cod-form {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/includes/nav.jsp" />

	<div class="container">
		<div class="py-5 text-center">

			<h2>Checkout</h2>

		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your items</span> <span
						class="badge badge-secondary badge-pill">3</span>
				</h4>
				<ul class="list-group mb-3">
					<%
					if (cart != null && !cart.isEmpty()) {
					%>
					<%
					for (Cart cartItem : cart) {
					%>
					<%
					subTotal = subTotal + cartItem.getQuantity() * cartItem.getPrice();
					%>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0"><%=cartItem.getName()%></h6>
							<small class="text-muted">X <%=cartItem.getQuantity()%></small>
						</div> <span class="text-muted">Rs. <%=cartItem.getPrice()%>0
					</span>
					</li>


					<%
					}
					}
					%>



					<li class="list-group-item d-flex justify-content-between"><span>Total
							(LKR)</span> <strong>Rs. <%=subTotal%>0
					</strong></li>
				</ul>

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Address</h4>
				<form class="needs-validation" novalidate action="MakeOrderServlet"
					method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<input type="hidden" name="method" id="payMethod" value="card" />
							<label for="firstName">First name</label> <input type="text"
								class="form-control" id="firstName" placeholder=""
								name="firstName" value="<%=user.getFirstName()%>" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">Last name</label> <input type="text"
								class="form-control" id="lastName" placeholder=""
								name="lastName" value="<%=user.getLastName()%>" required>
						</div>
					</div>


					<div class="mb-3">
						<label for="email">Email </label> <input type="email"
							class="form-control" id="email" name="email"
							value="<%=user.getEmail()%>" placeholder="you@example.com">
					</div>
					<div class="mb-3">
						<label for="phone">Phone</label> <input type="text"
							class="form-control" id="email" name="phone"
							value="<%=user.getPhone()%>" placeholder="xxx-xxxxxxx" required>
					</div>

					<div class="mb-3">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" placeholder="1234 Main St"
							name="address" value="<%=user.getAddress()%>" required>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name">Country</label> 
							<input type="text" name="country" class="form-control"  placeholder="Country" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">Postal Code</label> 
							<input type="text" class="form-control" id="cc-number" name="postal_code" placeholder="Postal code" required>
						</div>
					</div>


					<h4 class="mb-3">Payment</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" onchange="displayRadioValue()"
								name="paymentMethod" type="radio" class="custom-control-input"
								checked value="card" required> <label
								class="custom-control-label" for="credit">Credit / Debit
								card</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" onchange="displayRadioValue()"
								name="paymentMethod" type="radio" value="cod"
								class="custom-control-input" required> <label
								class="custom-control-label" for="paypal">Cash on
								delivery</label>
						</div>
					</div>

					<div class="card-form">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="cc-name">Name on card</label> <input type="text"
									name="name_card" class="form-control" id="cc-name"
									placeholder="John doe" required> <small
									class="text-muted">Full name as displayed on card</small>
								<div class="invalid-feedback">Name on card is required</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="cc-number">Credit card number</label> <input
									type="text" class="form-control" id="cc-number"
									name="card_number" placeholder="XXXX XXXX XXXX XXXX" required>
								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 mb-3">
								<label for="cc-expiration">Expiration</label> <input type="text"
									class="form-control" id="cc-expiration" placeholder="MM/YY"
									name="exp" required>
								<div class="invalid-feedback">Expiration date required</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="cc-cvv">CVV</label> <input type="text"
									class="form-control" id="cc-cvv" placeholder="XXX" name="cvv"
									required>
								<div class="invalid-feedback">Security code required</div>
							</div>
						</div>
					</div>

					<div class="cod-form">
						<div class="alert alert-info" role="alert">
							Your total cost is Rs.<%=subTotal + 250%>0
						</div>
					</div>

					<hr class="mb-4">

					<%
					ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errors");
					%>
					<%
					if (errors != null) {
					%>

					<%
					for (String error : errors) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=error%>
					</div>

					<%
					}
					%>


					<%
					}
					%>

					<button class="btn btn-primary btn-lg btn-block" type="submit">Continue</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		function displayRadioValue() {
			var ele = document.getElementsByName('paymentMethod');
			var inputPayMethod = document.getElementById('payMethod');

			for (i = 0; i < ele.length; i++) {
				if (ele[i].checked) {
					if (ele[i].value === "card") {
						document.querySelector(".card-form").style.display = "block";
						document.querySelector(".cod-form").style.display = "none";
						inputPayMethod.value = "card"
					} else {
						document.querySelector(".card-form").style.display = "none";
						document.querySelector(".cod-form").style.display = "block";
						inputPayMethod.value = "cod"
					}
				}
			}
		}
	</script>

</body>
</html>