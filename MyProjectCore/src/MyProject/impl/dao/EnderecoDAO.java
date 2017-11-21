package MyProject.impl.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import MyProjectDominio.Endereco;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;

public class EnderecoDAO extends AbstractJdbcDAO {

	public EnderecoDAO() {
		super("Nome", " ID");
		
	}

	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;		
		Endereco endereco = (Endereco)entidade;
		try {
			connection.setAutoCommit(false);
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Endereco(tipo_Residencia, tipo_Logradouro, logradouro, numero, bairro, CEP,cidade,estado, pais, obs, pref) ");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?)");
					
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, endereco.getTipo_res());
			pst.setString(2, endereco.getTipo_log());
			pst.setString(3, endereco.getLogradouro());
			pst.setString(4, endereco.getNumero());
			pst.setString(5, endereco.getBairro());
			pst.setString(6, endereco.getCep());
			pst.setString(7, endereco.getCidade());
			pst.setString(8, endereco.getEstado());
			pst.setString(9, endereco.getPais());
			pst.setString(10, endereco.getObs());
			pst.setBoolean(11,endereco.getPref());
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
