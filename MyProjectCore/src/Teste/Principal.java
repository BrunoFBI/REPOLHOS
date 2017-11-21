package Teste;

import java.sql.SQLException;
import java.util.Calendar;

import javax.swing.JOptionPane;

import MyProject.impl.dao.ClienteDAO;
import MyProject.impl.dao.LivroDAO;
import MyProjectDominio.Cliente;
import MyProjectDominio.Livro;

public class Principal {

	public static void main(String[] args) throws SQLException {
		
		ClienteDAO Cdao = new ClienteDAO();
		Cliente cliente = new Cliente();
		Calendar c = Calendar.getInstance();
		c.set(2010, 11, 15);
		cliente.setNome("Perereca");
		cliente.setCpf("CudemocaS");
		//cliente.setDt_nasc(c);
		try {
			Cdao.salvar(cliente);
		}catch (Exception e) {
			// TODO: handle exception
		}
		}

}
