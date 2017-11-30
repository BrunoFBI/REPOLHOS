package MyProject.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.swing.JOptionPane;

import MyProjectDominio.Cliente;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;


public class ClienteDAO extends AbstractJdbcDAO {

		public ClienteDAO() {
		super("Nome", " ID");
		
	}
	@Override
	
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;		
		Cliente cliente = (Cliente)entidade;
		try {
			connection.setAutoCommit(false);	
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Clientes( Nome, Dt_nasc, Dt_Cadastro, CPF, Genero, Tipo_tel, Telefone, Email, senha, status) ");
			sql.append("VALUES (?,?,sysdate(),?,?,?,?,?,?,?)");
					
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, cliente.getNome());
			Timestamp time = new Timestamp(cliente.getDt_nasc().getTime());
			pst.setTimestamp(2, time);
			pst.setString(3, cliente.getCpf());
			pst.setString(4, cliente.getGenero());
			pst.setString(5, cliente.getTipo_tel());
			pst.setString(6, cliente.getTelefone());
			pst.setString(7, cliente.getEmail());
			pst.setString(8, cliente.getSenha());
			pst.setBoolean(9,cliente.getStatus());
			pst.executeUpdate();			
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

	@Override
	public void alterar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Cliente cliente = (Cliente)entidade;
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE Clientes SET Nome=?, Dt_nasc=?, CPF=?, Genero=?, Tipo_tel=?, Telefone=?, Email=?, senha=?, status=?,");
			sql.append(" WHERE ID_Cliente=?");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, cliente.getNome());
			Timestamp time = new Timestamp(cliente.getDt_nasc().getTime());
			pst.setTimestamp(2, time);
			pst.setString(3, cliente.getCpf());
			pst.setString(4, cliente.getGenero());
			pst.setString(5, cliente.getTipo_tel());
			pst.setString(6, cliente.getTelefone());
			pst.setString(7, cliente.getEmail());
			pst.setString(8, cliente.getSenha());
			pst.setBoolean(9,cliente.getStatus());
			pst.setInt(10,cliente.getId());
			System.out.println(cliente.getNome());
			pst.executeUpdate();			
			connection.commit();
			System.out.println("Burguesinha");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;
		StringBuilder sql = new StringBuilder();

		sql.append( "SELECT * FROM clientes where 1=1 ");
		if (cliente.getId()!= null) {
			sql.append("AND ID_Cliente = '" + cliente.getId() + "'");
			
		}
		try {
			openConnection();
			pst = connection.prepareStatement(sql.toString());
			System.out.println(sql.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> clientes = new ArrayList<EntidadeDominio>();
			
			
			
				while(rs.next()){
					Cliente c = new Cliente();
					c.setId(rs.getInt("ID_cliente"));
					c.setGenero(rs.getString("Genero"));
					c.setEmail(rs.getString("Email"));
					c.setNome(rs.getString("Nome"));
					c.setDt_nasc(rs.getDate("Dt_nasc"));
					c.setCpf(rs.getString("Cpf"));
					c.setTipo_tel(rs.getString("Tipo_tel"));
					c.setTelefone(rs.getString("Telefone"));
					c.setStatus(rs.getBoolean("status"));
					c.setDt_Cadastro(rs.getDate("Dt_Cadastro"));
					clientes.add(c);

				}
				return clientes;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
	}

}
