<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Order"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includes/admin/header.jsp" />
</head>
<body>
	<div class="d-flex" id="wrapper">

		<!-- Side bar -->
		<jsp:include page="/includes/admin/sidebar.jsp" />

		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->

			<jsp:include page="/includes/admin/navigation.jsp" />

			<!-- Page content-->
			<div class="container-fluid">
				<h3 class="mt-4 mb-4">Orders</h3>
				
				
				<table class="table table-striped">
				<thead>
					<tr>
						<td>Id</td>
						<td>Order Number</td>
						<td>Customer Id</td>
						<td>Price</td>
						<td>Payment method</td>
						<td>Status</td>

					</tr>
				</thead>
				<tbody>
					<% ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders"); %>

					<% if (orders != null && !orders.isEmpty()) { %>
						<% for(Order order: orders){ %>
						<tr>
							<td> <%= order.getOrderId() %> </td>
							<td> <%= order.getOrderNumber() %> </td>
							<td> <%= order.getCustomerId() %> </td>
							<td> <%= order.getPrice() %> </td>
							<td> <%= order.getPaymentMethod() %> </td>
							<td> 
							<%= order.getStatus() %>
							<form action="AdminUpdateStatusServlet" method="post">
							<input type="hidden" name="order_id" value="<%=order.getOrderId() %>" />
								<select onchange="this.form.submit()" name="status" class="form-control">
								<option value="Pending">Pending</option>
								<option value="Confirmed">Confirmed</option>
								<option value="Rejected">Rejected</option>
								<option value="Delivered">Delivered</option>
							</select>
							</form>
							 </td>
						</tr>
						<% } %>
						
					<% } %>
					
				</tbody>
				</table>

			</div>

		</div>
	</div>
	<jsp:include page="/includes/admin/footer.jsp" />
</body>
</html>