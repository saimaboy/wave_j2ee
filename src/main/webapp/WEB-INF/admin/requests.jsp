<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Supplier"%>
<%@ page import="models.accesories"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Requests</title>
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
				<h3 class="mt-4 mb-4">Requests</h3>
				
				<%  if(request.getAttribute("errors")!=null){ %>
				<% ArrayList<String> errors = (ArrayList<String>)request.getAttribute("errors"); %>
				<% for(String error:errors) {%>
									
				<div class="alert alert-danger" role="alert">
				  <%=error %>
				</div>
				<% } }%>
				
				
				<table class="table table-striped">
				<thead>
					<tr>
						<td>Id</td>
						<td>Name</td>
						<td>Quantity</td>
						<td>Supplier</td>
						<td>ISBN</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody>
					<% ArrayList<accesories> accesories = (ArrayList<accesories>) request.getAttribute("accesories"); %>

					<% if (accesories != null && !accesories.isEmpty()) { %>
						<% for(accesories accesories1: accesories){ %>
						<tr>
							<td> <%= accesories1.getId() %> </td>
							<td> <%= accesories1.getName() %> </td>
							<td> <%= accesories1.getQuantity() %> </td>
							<td> <%= accesories1.getSupplierName() %> </td>
							<td> <%= accesories1.getIsbn() %> </td>
							<td> <a href="AdminSendMsgToSupplierServlet?sup=<%=accesories1.getSupplierName() %>" class="btn btn-warning">Send message</a> </td>

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