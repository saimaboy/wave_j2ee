<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.accesories"%>
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
		<jsp:include page="/includes/employee/sidebar.jsp" />

		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->

			<jsp:include page="/includes/employee/navigation.jsp" />

			<!-- Page content-->
			<div class="container-fluid">
				<h3 class="mt-4 mb-4">Update accesories</h3>

				<%
				accesories accesories = (accesories) request.getAttribute("book");
				%>

				<form action="EmployeeUpdateBookServlet" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label>Book Name</label> <input type="hidden" name="id"
							value="<%=accesories.getId()%>" /> <input type="text" name="book_name"
							class="form-control" value="<%=accesories.getName()%>" required />
					</div>
					<div class="mb-3">
						<label>Price</label> <input type="number" name="price"
							value="<%=accesories.getPrice()%>" class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Author</label> <input type="text" name="author" value="<%=accesories.getBrand()%>"
							class="form-control" required />
					</div>
					
					
				

					
					
					
					<div class="mb-3">
						<label>ISBN</label> <input type="text" name="isbn" value="<%=accesories.getIsbn()%>"
							class="form-control" required />
					</div>
					<div class="mb-3">
						<label>Quantity</label> <input type="number" name="qty"
							value="<%=accesories.getQuantity()%>" class="form-control" required />
					</div>
					
					<div class="mb-3">
						<label>Image</label> <input type="file" name="image"
							value="<%=accesories.getImage()%>" class="form-control" required />
					</div>

					

					<div class="mb-3">
						<label>Description</label>
						<textarea name="description" class="form-control"><%=accesories.getDescription()%></textarea>
					</div>

					<%
					ArrayList<Supplier> suppliers = (ArrayList<Supplier>) request.getAttribute("suppliers");
					%>


					<div class="mb-3">
						<label>Supplier</label> <select name="supplier"
							class="form-control">
							<%
							if (suppliers != null && !suppliers.isEmpty()) {
							%>
							<%
							for (Supplier supplier : suppliers) {
							%>
							<option value="<%=supplier.getId()%>"><%=supplier.getName()%></option>
							<%
							}
							}
							%>

						</select>
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