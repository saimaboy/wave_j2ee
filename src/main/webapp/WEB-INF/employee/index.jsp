<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.accesories"%>
<%
  String contextPath = request.getContextPath();
%>
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
		<jsp:include page="/includes/employee/sidebar.jsp" />

		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->

			<jsp:include page="/includes/employee/navigation.jsp" />

			<!-- Page content-->
			<div class="container-fluid">

				<%
				String msg = (String) request.getAttribute("msg");
				%>

				<%
				if (msg != null) {
				%>
				<h3 class="mt-4 mb-4">accesories - Low stock</h3>
				<%
				} else {
				%>
				<h3 class="mt-4 mb-4">All Books</h3>
				<%
				}
				%>
				
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
							<td>accesories</td>
							<td>Price</td>
							<td>Brand</td>
							<td>Category</td>
							<td>ISBN</td>
							<td>Quantity</td>
							<td>Description</td>
							<td>Supplier</td>
							<td>Update</td>
							<td>Delete</td>
							
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<accesories> accesories = (ArrayList<accesories>) request.getAttribute("accesories");
						%>

						<%
						if (accesories != null && !accesories.isEmpty()) {
						%>
						<%
						for (accesories accesories1 : accesories) {
						%>
						<tr>
							<td><%=accesories1.getId()%></td>
							<td>
							
							<%=accesories1.getName()%>
							<img style="width: 100%; height: 100px; object-fit: cover;" class="card-img-top" src="<%=contextPath %>/uploads/<%=accesories1.getImage()%>" alt="..." />
							</td>
							<td><%=accesories1.getPrice()%></td>
							<td><%=accesories1.getBrand()%></td>
							<td><%=accesories1.getType()%></td>
							<td><%=accesories1.getIsbn()%></td>
							<td><%=accesories1.getQuantity()%></td>
							<td> <%=accesories1.getDescription() %> </td>
							<td><%=accesories1.getSupplierName()%></td>
							<td><a href="EmployeeGetBookServlet?id=<%=accesories1.getId()%>"
								class="btn btn-warning">Update</a></td>
							<td><a
								href="EmployeeDeleteBookServlet?id=<%=accesories1.getId()%>"
								class="btn btn-danger">Delete</a></td>
						</tr>
						<%
						}
						%>

						<%
						}
						%>

					</tbody>
				</table>
							<% String adminMsg = (String)request.getAttribute("adminMsg"); %>
							<% if(adminMsg!=null){ %>
									<div class="alert alert-success" role="alert">
									  <%=adminMsg %>
									</div>
							<%} %>
				
							<% if(msg!=null){ %>
								<a href="EmployeeSendMessageToAdmin" class="btn btn-outline-secondary">Send to admin</a>
							<%} %>

			</div>

		</div>
	</div>
	<jsp:include page="/includes/admin/footer.jsp" />
</body>
</html>