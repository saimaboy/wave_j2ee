package controllers.navigation;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Order;
import models.User;
import services.customer.CustomerService;

/**
 * Servlet implementation class CustomerNavigation
 */
@WebServlet("/CustomerNavigation")
public class CustomerNavigation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerNavigation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String to = request.getParameter("to");
		if(to.equals("MyOrders")) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			ArrayList<Order> orders = CustomerService.getMyOrders(user.getId());
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
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
