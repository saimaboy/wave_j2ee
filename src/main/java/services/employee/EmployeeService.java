package services.employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import models.accesories;
import models.Employee;
import models.TopCustomers;
import utils.DbConnection;

public class EmployeeService {
	private static PreparedStatement preparedStatement,preparedStatement1;
	private static Connection connection;
	private static ResultSet resultSet;

	public static boolean registerEmployee(Employee employee) {
		boolean result = false;

		try {
			connection = DbConnection.getDbConnection();
			String query = "INSERT INTO employees (username, email, password) VALUES(?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, employee.getUsername());
			preparedStatement.setString(2, employee.getEmail());
			preparedStatement.setString(3, employee.getPassword());
			
			result = preparedStatement.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public static Employee loginEmployee(String username, String password) {
		Employee employee = null;

		try {
			connection = DbConnection.getDbConnection();
			String query = "select * from employees where username = ? and password = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				employee = new Employee();
				employee.setId(resultSet.getInt("id"));
				employee.setUsername(resultSet.getString("username"));
				employee.setEmail(resultSet.getString("email"));
				employee.setPassword(resultSet.getString("password"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return employee;
	}

	public static boolean addNewaccesories(accesories accesories) {
		boolean result = false;

		try {
			connection = DbConnection.getDbConnection();
			String query = "INSERT INTO books (name, price, quantity,supplier, description,image,brand, type, isbn) VALUES(?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, accesories.getName());
			preparedStatement.setDouble(2, accesories.getPrice());
			preparedStatement.setInt(3, accesories.getQuantity());
			preparedStatement.setInt(4, accesories.getSupplier());
			preparedStatement.setString(5, accesories.getDescription());
			preparedStatement.setString(6, accesories.getImage());
			preparedStatement.setString(7, accesories.getBrand());
			preparedStatement.setString(8, accesories.getType());
			preparedStatement.setString(9, accesories.getIsbn());
			
			String query1 = "INSERT INTO current_books (name, price, quantity,supplier, description,image,brand, type, isbn) VALUES(?,?,?,?,?,?,?,?,?)";
			preparedStatement1 = connection.prepareStatement(query1);
			preparedStatement1.setString(1, accesories.getName());
			preparedStatement1.setDouble(2, accesories.getPrice());
			preparedStatement1.setInt(3, accesories.getQuantity());
			preparedStatement1.setInt(4, accesories.getSupplier());
			preparedStatement1.setString(5, accesories.getDescription());
			preparedStatement1.setString(6, accesories.getImage());
			preparedStatement1.setString(7, accesories.getBrand());
			preparedStatement1.setString(8, accesories.getType());
			preparedStatement1.setString(9, accesories.getIsbn());

			result = preparedStatement.executeUpdate() > 0 && preparedStatement1.executeUpdate() >0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (preparedStatement1 !=null) {
					preparedStatement1.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public static ArrayList<accesories> getAllaccesories() {
		ArrayList<accesories> accesories = new ArrayList<>();

		try {
			connection = DbConnection.getDbConnection();
			String query = "select b.id , b.name, b.price, b.quantity , b.description, b.image, b.brand, b.type, b.isbn, s.name as 'sup_name' from current_books b , suppliers s where b.supplier = s.id ";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				accesories accesories1 = new accesories();
				accesories1.setId(resultSet.getInt("id"));
				accesories1.setName(resultSet.getString("name"));
				accesories1.setPrice(resultSet.getDouble("price"));
				accesories1.setQuantity(resultSet.getInt("quantity"));
				accesories1.setSupplierName(resultSet.getString("sup_name"));
				accesories1.setDescription(resultSet.getString("description"));
				accesories1.setImage(resultSet.getString("image"));
				accesories1.setBrand(resultSet.getString("brand"));
				accesories1.setType(resultSet.getString("type"));
				accesories1.setIsbn(resultSet.getString("isbn"));
				accesories1.add(accesories1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return accesories;
	}

	public static boolean deleteBook(int id) {
		boolean result = false;

		try {
			connection = DbConnection.getDbConnection();
			String query = "delete from current_books where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public static accesories getSingleaccesories(int id) {
		accesories accesories = null;

		try {
			connection = DbConnection.getDbConnection();
			String query = "select * from current_books where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			
			String query1 = "select * from accesories where id = ?";
			preparedStatement1 = connection.prepareStatement(query1);
			preparedStatement1.setInt(1, id);
			
			resultSet = preparedStatement.executeQuery();
			resultSet = preparedStatement1.executeQuery();

			while (resultSet.next()) {
				accesories = new accesories();
				accesories.setId(resultSet.getInt("id"));
				accesories.setName(resultSet.getString("name"));
				accesories.setPrice(resultSet.getDouble("price"));
				accesories.setQuantity(resultSet.getInt("quantity"));
				accesories.setImage(resultSet.getString("image"));
				accesories.setDescription(resultSet.getString("description"));
				accesories.setBrand(resultSet.getString("brand"));
				accesories.setType(resultSet.getString("type"));
				accesories.setIsbn(resultSet.getString("isbn"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return accesories;
	}

	public static boolean updateaccesories(accesories accesories) {
		boolean result = false;

		try {
			connection = DbConnection.getDbConnection();
			String query = "update current_books set name=?, price=?, quantity=?, supplier=?, description=?, image=?, brand = ?, type = ?, isbn = ? where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, accesories.getName());
			preparedStatement.setDouble(2, accesories.getPrice());
			preparedStatement.setInt(3, accesories.getQuantity());
			preparedStatement.setInt(4, accesories.getSupplier());
			preparedStatement.setString(5, accesories.getDescription());
			preparedStatement.setString(6, accesories.getImage());
			preparedStatement.setString(7,accesories.getBrand());
			preparedStatement.setString(8, accesories.getType());
			preparedStatement.setString(9, accesories.getIsbn());
			preparedStatement.setInt(10, accesories.getId());
			
			String query1 = "update books set name=?, price=?, quantity=?, supplier=?, description=?, image=?, brand = ?, type = ?, isbn = ? where id = ?";
			preparedStatement1 = connection.prepareStatement(query1);
			preparedStatement1.setString(1,accesories.getName());
			preparedStatement1.setDouble(2, accesories.getPrice());
			preparedStatement1.setInt(3, accesories.getQuantity());
			preparedStatement1.setInt(4, accesories.getSupplier());
			preparedStatement1.setString(5, accesories.getDescription());
			preparedStatement1.setString(6, accesories.getImage());
			preparedStatement1.setString(7, accesories.getBrand());
			preparedStatement1.setString(8,accesories.getType());
			preparedStatement1.setString(9, accesories.getIsbn());
			preparedStatement1.setInt(10, accesories.getId());
			result = preparedStatement.executeUpdate() > 0 && preparedStatement1.executeUpdate() >0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (preparedStatement1 != null) {
					preparedStatement1.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public static ArrayList<accesories> getLowQtyaccesories() {
		ArrayList<accesories> books = new ArrayList<accesories>();
		try {
			connection = DbConnection.getDbConnection();
			String query = "select b.id , b.name, b.price, b.quantity , b.description, b.image, b.author, b.publisher, b.isbn, s.name as 'sup_name' from books b JOIN suppliers s ON b.supplier = s.id JOIN current_books cb ON b.id = cb.id where b.quantity < 5";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				accesories accesories = new accesories ();
				accesories.setId(resultSet.getInt("id"));
				accesories.setName(resultSet.getString("name"));
				accesories.setPrice(resultSet.getDouble("price"));
				accesories.setQuantity(resultSet.getInt("quantity"));
				accesories.setSupplierName(resultSet.getString("sup_name"));
				accesories.setImage(resultSet.getString("image"));
				accesories.setBrand(resultSet.getString("brand"));
				accesories.setType(resultSet.getString("type"));
				accesories.setDescription(resultSet.getString("description"));
				accesories.setIsbn(resultSet.getString("isbn"));
				accesories.add(accesories);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return books;
	}

	public static boolean lowaccesories(ArrayList<accesories> accesories) {
		boolean result = false;

		try {
			connection = DbConnection.getDbConnection();

			for (accesories accesories1 : accesories) {
				String query = "INSERT INTO low_accesories(name, quantity, sup_name, isbn) VALUES (?,?,?,?)";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, accesories1.getName());
				preparedStatement.setInt(2, accesories1.getQuantity());
				preparedStatement.setString(3, accesories1.getSupplierName());
				preparedStatement.setString(4, accesories1.getIsbn());
				result = preparedStatement.executeUpdate() > 0;

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public static ArrayList<accesories> lowBooksReq() {
		ArrayList<accesories> accesories = new ArrayList<accesories>();
		try {
			connection = DbConnection.getDbConnection();
			String query = "SELECT * FROM low_books";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				accesories accesories1 = new accesories();
				accesories1.setId(resultSet.getInt("id"));
				accesories1.setName(resultSet.getString("name"));
				accesories1.setQuantity(resultSet.getInt("quantity"));
				accesories1.setSupplierName(resultSet.getString("sup_name"));
				accesories1.setIsbn(resultSet.getString("isbn"));
				accesories1.add(accesories1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return accesories;
	}
	
	public static ArrayList<accesories> getBookReport(){
		ArrayList<accesories> books = new ArrayList<accesories>();
		
		try {
			connection = DbConnection.getDbConnection();
			String query = "SELECT b.id, b.name, b.supplier, SUM(oi.quantity) AS total_quantity, b.price, s.name AS sup_name FROM orders o INNER JOIN order_items oi ON o.order_id = oi.order_id INNER JOIN books b ON oi.book_id = b.id INNER JOIN suppliers s ON b.supplier = s.id WHERE MONTH(o.order_date) = MONTH(CURRENT_DATE()) AND YEAR(o.order_date) = YEAR(CURRENT_DATE()) GROUP BY b.id, b.name, b.supplier ORDER BY total_quantity DESC";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				accesories accesories = new accesories();
				accesories.setId(resultSet.getInt("id"));
				accesories.setName(resultSet.getString("name"));
				accesories.setQuantity(resultSet.getInt("total_quantity"));
				accesories.setPrice(resultSet.getDouble("price"));
				accesories.setSupplierName(resultSet.getString("sup_name"));
				accesories.add(accesories);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return books;
	}
	
	public static ArrayList<TopCustomers> getTopCustomers(){
		ArrayList<TopCustomers> customers = new ArrayList<TopCustomers>();
		
		try {
			connection = DbConnection.getDbConnection();
			String query = "SELECT o.customer_id, u.first_name, u.last_name, SUM(oi.quantity) AS total_quantity, SUM(oi.price) AS total_sales FROM orders o INNER JOIN order_items oi ON o.order_id = oi.order_id INNER JOIN users u ON u.id = o.customer_id WHERE MONTH(o.order_date) = MONTH(CURRENT_DATE()) AND YEAR(o.order_date) = YEAR(CURRENT_DATE()) GROUP BY o.customer_id ORDER BY total_quantity DESC LIMIT 10";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				TopCustomers topCustomers = new TopCustomers();
				topCustomers.setId(resultSet.getInt("customer_id"));
				topCustomers.setName(resultSet.getString("first_name") + " " + resultSet.getString("last_name"));
				topCustomers.setQuantity(resultSet.getInt("total_quantity"));
				topCustomers.setTotal(resultSet.getDouble("total_sales"));
				
				customers.add(topCustomers);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return customers;
	}

	public static accesories getSingleAccesories(int id) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Unimplemented method 'getSingleAccesories'");
	}

	

}