package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	
	private static Connection connection;
		
	private DbConnection() {}
	
	  public static Connection getDbConnection() throws ClassNotFoundException, SQLException {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        if (connection == null || connection.isClosed()) {
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/comshop", "root", "12345678");
	        }
	        return connection;
	    }
	
}
