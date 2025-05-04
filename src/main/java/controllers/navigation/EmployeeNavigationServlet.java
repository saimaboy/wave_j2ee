package controllers.navigation;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.accesories;
import models.Supplier;
import models.TopCustomers;
import services.admin.AdminService;
import services.employee.EmployeeService;

/**
 * Servlet implementation class EmployeeNavigationServlet
 */
@WebServlet("/EmployeeNavigationServlet")
public class EmployeeNavigationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeNavigationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String to = request.getParameter("to");
		if(to.equals("EmpHome")) {
			ArrayList<accesories> accesories = EmployeeService.getAllaccesories();
			request.setAttribute("accesories", accesories);
			request.getRequestDispatcher("WEB-INF/employee/index.jsp").forward(request, response);
		}else if(to.equals("NewBook")) {
			ArrayList<Supplier> suppliers = AdminService.getAllSuppliers();
			request.setAttribute("suppliers", suppliers);
			request.getRequestDispatcher("WEB-INF/employee/new-book.jsp").forward(request, response);
		}else if(to.equals("BookReport")) {
			ArrayList<accesories> accesories = EmployeeService.getaccesoriesReport();
			request.setAttribute("AccesoriesReport", accesories);
			request.getRequestDispatcher("WEB-INF/employee/book-report.jsp").forward(request, response);
		}else if(to.equals("TopCustomers")) {
			ArrayList<TopCustomers> customers = EmployeeService.getTopCustomers();
			request.setAttribute("customerReport", customers);
			request.getRequestDispatcher("WEB-INF/employee/customer-report.jsp").forward(request, response);
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
