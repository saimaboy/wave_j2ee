<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h3 class="mt-4 mb-4">Update Supplier</h3>
				<%
				Supplier supplier = (Supplier) request.getAttribute("supplier");
				%>

				<form action="AdminUpdateSupplierServlet" method="post">
					<div class="mb-3">
						<label>Supplier Name</label> 
						<input type="hidden"
							name="id" value="<%=supplier.getId()%>"
							class="form-control" required />
						<input type="text"
							name="supplier_name" value="<%=supplier.getName()%>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Company Name</label> <input type="text" name="company_name" value="<%=supplier.getCompany()%>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Email</label> <input type="text" name="supplier_email"  value="<%=supplier.getEmail() %>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Phone</label> <input type="text" name="supplier_phone" value="<%=supplier.getPhone() %>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Address</label> <input type="text" name="supplier_address" value="<%=supplier.getAddress()%>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<input type="submit" name="submit" value="Update"
							class="btn btn-primary" />
					</div>
				</form>
			</div>

		</div>
	</div>
	<jsp:include page="/includes/admin/footer.jsp" />
</body>
</html>