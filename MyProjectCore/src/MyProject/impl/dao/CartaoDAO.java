package MyProject.impl.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import MyProjectDominio.Cartao;
import MyProjectDominio.EntidadeDominio;

public class CartaoDAO extends AbstractJdbcDAO  {

	public CartaoDAO() {
		super("", "");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Cartao c = (Cartao)entidade;
		try {
			
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO cartao(numero, bandeira, dtVencimento, codigo_seg, pk_cliente) VALUES (?,?,?,?,?)");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, c.getNumero());
			pst.setString(2, c.getBandeira());
			pst.setString(3, c.getValidade());
			pst.setString(4, c.getCodigo());
			pst.setInt(5, c.getID_Cliente());

			
			pst.executeUpdate();			
			connection.commit();
		} catch (SQLException e) {
			try {
				pst.close();
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
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
