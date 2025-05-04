package controllers.navigation;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.accesories;
import models.Order;
import models.Supplier;
import services.admin.AdminService;
import services.employee.EmployeeService;

/**
 * Servlet implementation class AdminNavigationServlet
 */
@WebServlet("/AdminNavigationServlet")
public class AdminNavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNavigationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String to = request.getParameter("to");
		if(to.equals("NewSupplier")) {
			request.getRequestDispatcher("WEB-INF/admin/new-supplier.jsp").forward(request, response);
		}else if(to.equals("AdminHome")) {
			ArrayList<Supplier> suppliers = AdminService.getAllSuppliers();
			request.setAttribute("suppliers", suppliers);
			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);
		}else if(to.equals("Orders")) {
			ArrayList<Order> orders = AdminService.getAllOrders();
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("WEB-INF/admin/orders.jsp").forward(request, response);
		}else if(to.equals("Requests")) {
			ArrayList<accesories> accesories= EmployeeService.lowAccesoriesReq();
			request.setAttribute("accesories", accesories);
			request.getRequestDispatcher("WEB-INF/admin/requests.jsp").forward(request, response);
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
