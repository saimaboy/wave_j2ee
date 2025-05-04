package controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Supplier;
import services.admin.AdminService;

/**
 * Servlet implementation class AdminAddSupplierServlet
 */
@WebServlet("/AdminAddSupplierServlet")
public class AdminAddSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAddSupplierServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public boolean isValidPhoneNumber(String phoneNumber) {
		String regex = "^[0-9]{10}$";

		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(phoneNumber);

		return matcher.matches();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String companyName = request.getParameter("company_name");
		String supplierName = request.getParameter("supplier_name");
		String email = request.getParameter("supplier_email");
		String phone = request.getParameter("supplier_phone");
		String address = request.getParameter("supplier_address");

		ArrayList<String> errors = new ArrayList<String>();

		Supplier supplier = new Supplier();

		if (!isValidPhoneNumber(phone)) {
			errors.add("Invalid phone number");
		}

		if (errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);

		} else {
			supplier.setAddress(address);
			supplier.setEmail(email);
			supplier.setPhone(phone);
			supplier.setCompany(companyName);
			supplier.setName(supplierName);

			boolean result = AdminService.addSupplier(supplier);

			if (result == true) {
				response.sendRedirect("AdminNavigationServlet?to=AdminHome");
			} else {
				response.sendRedirect("AdminNavigationServlet?to=NewSupplier");
			}
		}
	}

}
