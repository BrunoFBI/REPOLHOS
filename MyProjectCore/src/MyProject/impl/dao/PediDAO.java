package MyProject.impl.dao;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProjectDominio.Pedido;
import MyProjectDominio.Unidade;

public class PediDAO extends AbstractJdbcDAO {
public PediDAO() {
			super("pedidos", " ID");
			
		}

	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Pedido pedido = (Pedido)entidade;
		
		

		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Pedido( quantidade, dt_pedido, Pstatus,  id_cliente, id_endereco, vlr_total, frete) "
					+ "VALUES (?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			Date date = new Date(pedido.getDtPedido().getTime());
			pst.setInt(1, pedido.getQtdItens() );
			pst.setDate(2,  date);
			pst.setString(3, pedido.getStatus());
			pst.setInt(4, pedido.getIDusuario());
			pst.setInt(5, pedido.getEndereco().getId());
			pst.setDouble(6, pedido.getPrecoTotal());
			pst.setDouble(7, pedido.getPrecoFrete());
			pst.executeUpdate();
			
			
			ResultSet rs = pst.getGeneratedKeys();
			int idPedido = 0;
			if(rs.next())
				idPedido = rs.getInt(1);
			pedido.setId(idPedido);
			for (int i = 0; i < pedido.getUnidade().size(); i++) {
				Unidade unidade = pedido.getUnidade().get(i);
				Livro l = pedido.getUnidade().get(i).getLivro();
				pst = connection.prepareStatement(
				"INSERT INTO ItensPedido( pedido_id, quantidade, id_livro, preço) VALUES (?, ?, ?, ?)");
				pst.setInt(1, pedido.getId());
				pst.setInt(2, unidade.getQuantidade());
				pst.setInt(3, l.getId());
				pst.setDouble(4, unidade.getPreco());
				pst.executeUpdate();
			}
			
			int id = 0;
			if (rs.next())
				id = rs.getInt(1);
		
			

			connection.commit();
		
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
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