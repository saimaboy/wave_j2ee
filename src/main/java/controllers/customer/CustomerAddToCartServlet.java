package controllers.customer;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.accesories;
import models.Cart;
import models.ShoppingCart;
import services.cart.CartService;
import services.employee.EmployeeService;

/**
 * Servlet implementation class CustomerAddToCartServlet
 */
@WebServlet("/CustomerAddToCartServlet")
public class CustomerAddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id  = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		
		ShoppingCart shoppingCart = new ShoppingCart();
		
		if(session.getAttribute("user")==null) {
			response.sendRedirect("customer-login.jsp");
		}else {
			accesories accesories = EmployeeService.getSingleAccesories(id);
			Cart cart =  new Cart();
			
			cart.setId(id);
			cart.setName(accesories.getName());
			cart.setPrice(accesories.getPrice());
			cart.setQuantity(1);
			
			shoppingCart.setId(id);
			shoppingCart.setName(cart.getName());
			shoppingCart.setPrice(cart.getPrice());
			shoppingCart.setQuantity(cart.getQuantity());
			shoppingCart.setTotal(cart.getPrice() * cart.getQuantity());
			
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart");
			
			if(cart_list == null) {
				cart_list = new ArrayList<>();

	            cart_list.add(cart);

	            session.setAttribute("cart", cart_list);
	            
                CartService.addToCart(shoppingCart);

	            response.sendRedirect("GetBookDetailsServlet?id="+id);
			}else {
				 ArrayList<Cart> cart_list_ = (ArrayList<Cart>) session.getAttribute("cart");
		            boolean exist = false;
		            for (Cart c : cart_list) {
		                if (c.getId() == id) {
		                    exist = true;
		                    response.sendRedirect("cart.jsp");
		                }
		            }

		            if (!exist) {
		                cart_list_.add(cart);
		                CartService.addToCart(shoppingCart);
		                response.sendRedirect("GetBookDetailsServlet?id="+id);
		            }
			}
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
