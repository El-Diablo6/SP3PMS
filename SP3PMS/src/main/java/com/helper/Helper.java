package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * The Helper class provides utility methods for database operations.
 * It handles the establishment of database connections, creation of
 * PreparedStatement objects, and closing of connections.
 */
public class Helper {
	
	
	static Connection connect;

	static PreparedStatement preparedStatement;
	

	/**
	 * Establishes a database connection and creates a PreparedStatement.
	 *
	 * @param sql The SQL query string to be prepared.
	 * @return The PreparedStatement object for executing the query.
	 * @throws ClassNotFoundException If the database driver class is not found.
	 * @throws SQLException           If a database access error occurs or the url is null.
	 */
	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
		System.out.println("i am in helper");
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver"); 
		Helper.connect=DriverManager.getConnection("jdbc:derby:D:\\Users\\2826130\\PMS;create=true");
		System.out.println("Connection established");
		Helper.preparedStatement=connect.prepareStatement(sql);
		
		return preparedStatement;
		

	}
	
	/**
	 * Closes the PreparedStatement and the database connection.
	 *
	 * @throws SQLException If a database access error occurs.
	 */
	public static void closeconnection() throws SQLException {
		Helper.preparedStatement.close();
		
		Helper.connect.close();
		System.out.println("Connection established");
		
	}

}
