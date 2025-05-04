<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Order"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<jsp:include page="/includes/header.jsp" />
</head>
<body>
	<jsp:include page="/includes/nav.jsp" />

	<section class="py-5">
		<div class="container px-4 px-lg-5">
			<h3 class="">MY ORDERS</h3>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<td>Order number</td>
							<td>Price</td>
							<td>Payment method</td>
							<td>Status</td>
						</tr>
					</thead>
					<% ArrayList<Order> orders = (ArrayList<Order>)request.getAttribute("orders"); %>
							<tbody>
					
					<% if (orders != null && !orders.isEmpty()) { %>
						<% for(Order order: orders){ %>
				
							<tr>
								<td><%=order.getOrderId() %></td>
								<td><%=order.getOrderNumber() %></td>
								<td><%=order.getPrice() %></td>
								<td><%=order.getPaymentMethod() %></td>
								<td>
									<%=order.getStatus() %>
								</td>
							</tr>
					
						<%}} %>
							</tbody>
	
				</table>

				
			</div>
				
		</div>
	</section>
</body>
</html>