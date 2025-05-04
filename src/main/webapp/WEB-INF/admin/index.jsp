<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Supplier"%>
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
				<h3 class="mt-4 mb-4">All suppliers</h3>

				<%
				if (request.getAttribute("errors") != null) {
				%>
				<%
				ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errors");
				%>
				<%
				for (String error : errors) {
				%>

				<div class="alert alert-danger" role="alert">
					<%=error%>
				</div>
				<%
				}
				}
				%>

				<%
				if (request.getAttribute("adminMsgToSup") != null) {
				%>
				<%
				String msg = (String) request.getAttribute("adminMsgToSup");
				%>
				<div class="alert alert-info" role="alert">
					<%=msg%>
				</div>
				<%
				}
				%>


				<form action="AdminSearchSupplierServlet" method="post">
					<div class="form-group mb-3">
						<input type="text" name="search_supplier" class="form-control"
							placeholder="Search supplier" required />
					</div>
					<div class="form-group mb-3">
						<input type="submit" name="submit" value="search"
							class="btn btn-secondary" />
					</div>
				</form>

				<table class="table table-striped">
					<thead>
						<tr>
							<td>Id</td>
							<td>Name</td>
							<td>Company</td>
							<td>Email</td>
							<td>Phone</td>
							<td>Address</td>
							<td>Update</td>
							<td>Delete</td>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Supplier> suppliers = (ArrayList<Supplier>) request.getAttribute("suppliers");
						%>

						<%
						if (suppliers != null && !suppliers.isEmpty()) {
						%>
						<%
						for (Supplier supplier : suppliers) {
						%>
						<tr>
							<td><%=supplier.getId()%></td>
							<td><%=supplier.getName()%></td>
							<td><%=supplier.getCompany()%></td>
							<td><%=supplier.getEmail()%></td>
							<td><%=supplier.getPhone()%></td>
							<td><%=supplier.getAddress()%></td>
							<td><a
								href="AdminGetSingleSupplierServlet?id=<%=supplier.getId()%>"
								class="btn btn-warning">Update</a></td>
							<td><a
								href="AdminDeleteSupplierServlet?id=<%=supplier.getId()%>"
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

			</div>

		</div>
	</div>
	<jsp:include page="/includes/admin/footer.jsp" />
</body>
</html>