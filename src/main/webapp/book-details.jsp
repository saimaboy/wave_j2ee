<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="models.accesories"%>
<%@ page import="models.Cart"%>
<%
String contextPath = request.getContextPath();
accesories accesories = (accesories) request.getAttribute("accesories");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book details</title>
<jsp:include page="includes/header.jsp" />
</head>
<body>
	<jsp:include page="includes/nav.jsp" />


	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="<%=contextPath%>/uploads/<%=accesories.getImage()%>" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">
						<b>ISBN:</b>
						<%=accesories.getIsbn()%></div>
					<div class="small mb-1">
						<b>Brand:</b>
						<%=accesories.getBrand()%></div>
					<div class="small mb-1">
						<b>Type:</b>
						<%=accesories.getType()%></div>
					<h1 class="display-5 fw-bolder"><%=accesories.getName()%></h1>
					<div class="fs-5 mb-5">
						<span>Rs. <%=accesories.getPrice()%></span>
					</div>
					<p class="lead"><%=accesories.getDescription()%></p>
					<div class="d-flex">
						<a class="btn btn-warning mt-auto"
							href="CustomerAddToCartServlet?id=<%=accesories.getId()%>"
							onclick="return addToCart()">Add to
							cart</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
    function addToCart() {
        alert('Book  added to cart successfully!');
        return true;
    }
</script>
</html>