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
		String url ="jdbc:mysql://localhost/teste";
		String user = "root";
		String password = "oi";
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("Conectado com Sucesso");
		return conn;
		

    }
}
