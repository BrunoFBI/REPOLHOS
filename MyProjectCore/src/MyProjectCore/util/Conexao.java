package MyProjectCore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	public static Connection getConnection() 
			throws ClassNotFoundException, SQLException
	{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Conectando ao banco");
		String url ="jdbc:mysql://localhost/myproject";
		String user = "root";
		String password = "123456";
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("Conectado com Sucesso");
		return conn;
		

    }
}
