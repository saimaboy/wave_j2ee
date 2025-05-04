package controllers.customer;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Cart;
import services.cart.CartService;

/**
 * Servlet implementation class DecQty
 */
@WebServlet("/DecQty")
public class DecQty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecQty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
        
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart");
        
        for (Cart c : cart_list) {

            if (c.getId() == id) {

                int quantity = c.getQuantity();

                if (quantity > 1) {
                    quantity--;
                	CartService.decreaseQty(id);
                    c.setQuantity(quantity);

                    break;

                }

            }
        }

        response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
