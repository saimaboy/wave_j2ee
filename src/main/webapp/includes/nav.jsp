<%@ page import="java.util.ArrayList"%>
<%@ page import="models.Book"%>
<%@ page import="models.Cart" %>
<%@ page import="models.User" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="HomeServlet">Computer Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="admin-login.jsp">Admin</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="emp-login.jsp">Employee login</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="emp-register.jsp">Employee register</a></li>
                    </ul>
                    <form action="GoToCart" method="get" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <% ArrayList<Cart> cart = (ArrayList<Cart>)session.getAttribute("cart"); %>
                            <span class="badge bg-dark text-white ms-1 rounded-pill">
                            <% if(cart!=null){ %>
                            	<%=cart.size() %>
                            <%}else{ %>
                            	0
                            <%} %>
                            </span>
                        </button>
                    </form>
                    <% User user = (User)session.getAttribute("user"); %>
                    
                    <% if(user==null){ %>
                     
                    <a href="customer-register.jsp" class="btn btn-outline-primary ms-2">Register</a>
                    <a href="customer-login.jsp" class="btn btn-primary ms-2">Login</a>
                    <%} else{%>
                    	   <a href="CustomerNavigation?to=MyOrders" class="btn btn-outline-primary ms-2"> Hello <%=user.getFirstName() %> </a>
                    	   <a href="LogoutServlet" class="btn btn-danger ms-2">Logout</a>
                    <%} %>
                   
                    
                </div>
            </div>
        </nav>