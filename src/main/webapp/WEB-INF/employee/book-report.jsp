<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.accesories"%>
<%@ page import="java.time.LocalDate"%>
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
				ArrayList<accesories> accesories = (ArrayList<accesories>) request.getAttribute("accesoriesReport");
				double total = 0;
				for (accesories accesories1 : accesories) {
					total += accesories1.getPrice() * accesories1.getQuantity();
				}
				%>
				<div class="d-flex flex-row ">
				<h5 class="mt-2">Month: <%=LocalDate.now().getMonth().toString() %></h5>
				<h5 class="mt-2 ms-5">Revenue: Rs: <%=total %></h5>
				</div>
				<h4 class="mt-4">Monthly Best Sellers</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<td> Id</td>
							<td> Name</td>
							<td>Type</td>
							<td>Price</td>
							<td>Quantity Sold</td>
							<td>Total Sales</td>

						</tr>
					</thead>

					<tbody>

						<%
						if (accesories != null && !accesories.isEmpty()) {
						%>
						<%
						for (accesories accesories1 : accesories) {
						%>
						<tr>
							<td><%=accesories1.getId()%></td>
							<td><%=accesories1.getName()%></td>
							<td><%=accesories1.getSupplierName()%></td>
							<td><%=accesories1.getPrice()%></td>
							<td><%=accesories1.getQuantity()%></td>
							<td><%=accesories1.getPrice() * accesories1.getQuantity()%></td>
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