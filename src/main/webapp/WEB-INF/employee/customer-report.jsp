<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.TopCustomers"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/includes/admin/header.jsp" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Side bar -->
		<jsp:include page="/includes/employee/sidebar.jsp" />

		<div id="page-content-wrapper">
			<jsp:include page="/includes/employee/navigation.jsp" />

			<!-- Page content-->
			<div class="container-fluid">
				<%
				ArrayList<TopCustomers> topCustomers = (ArrayList<TopCustomers>) request.getAttribute("customerReport");
				%>

				<h4 class="mt-4">Top customers</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<td>Id</td>
							<td>Name</td>
							<td>Quantity</td>
							<td>Total Sales</td>

						</tr>
					</thead>

					<tbody>

						<%
						if (topCustomers != null && !topCustomers.isEmpty()) {
						%>
						<%
						for (TopCustomers customer : topCustomers) {
						%>
						<tr>
							<td><%=customer.getId()%></td>
							<td><%=customer.getName()%></td>
							<td><%=customer.getQuantity()%></td>
							<td><%=customer.getTotal()%></td>
						</tr>
						<%
						}
						%>

						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>