<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order confirm</title>
<jsp:include page="/includes/header.jsp" />

</head>
<body>
	<jsp:include page="/includes/nav.jsp" />

	<div class="container">
		<div class="py-5 text-center">
		<% String orderNumber = (String)request.getAttribute("orderNumber"); %>

			<h3>Order Complete. Your Order number is <%=orderNumber %> </h3>
			
			<p>We've sent you an email with all the details of your order.</p>
			
			<a class="btn btn-outline-secondary" href="CustomerNavigation?to=MyOrders">View order details</a>

		</div>


	</div>
	
</body>
</html>