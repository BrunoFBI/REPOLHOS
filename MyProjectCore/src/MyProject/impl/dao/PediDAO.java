package MyProject.impl.dao;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import MyProjectDominio.Endereco;
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
			System.out.println("aaaaaaa " + pedido.getEndereco().getId() );
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

	



	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		try {
			openConnection();
			Pedido p = (Pedido)entidade;
			Integer idPedido = p.getId();
			PreparedStatement pst = null;

			
			if(p.getIDusuario() == null)
				pst = connection.prepareStatement("SELECT * FROM pedido WHERE id_pedido = " + idPedido);
			
			else {
				pst = connection.prepareStatement("SELECT * FROM pedido  INNER JOIN endereco e on e.ID_Endereco = pedido.id_endereco WHERE pedido.id_cliente = " + p.getIDusuario());
			}
			System.out.println("Sou pst" + pst);
			ResultSet pstPedido = pst.executeQuery();
			List<EntidadeDominio> pedidos = new ArrayList<EntidadeDominio>();
			while(pstPedido.next())
			{
				Endereco e = new Endereco();
				Pedido pedido = new Pedido();
				e.setLogradouro(pstPedido.getString("logradouro"));
				e.setBairro(pstPedido.getString("bairro"));
				e.setCep(pstPedido.getString("numero"));
				e.setCidade(pstPedido.getString("cidade"));
				e.setEstado(pstPedido.getString("estado"));
				e.setPais(pstPedido.getString("cidade"));
				
				pedido.setEndereco(e);
				pedido.setId(pstPedido.getInt("id_pedido"));
				pedido.setQtdItens(pstPedido.getInt("quantidade"));
				pedido.setDtPedido(pstPedido.getDate("dt_pedido"));
				pedido.setStatus(pstPedido.getString("Pstatus"));
				pedido.setIDusuario(pstPedido.getInt("id_cliente"));
				pedido.setPrecoTotal(pstPedido.getDouble("vlr_total"));
				pedido.setPrecoFrete(pstPedido.getDouble("frete"));
				
				
				pst = connection.prepareStatement("SELECT * FROM itenspedido"
						+ " INNER JOIN livros ON "
						+ "(itenspedido.id_livro = livros.id) WHERE 1=1");
				ResultSet itensPedido = pst.executeQuery();
				List<Unidade> unidade = new ArrayList<Unidade>();
				while(itensPedido.next())
				{
					Livro l = new Livro();
					Unidade i = new Unidade();
					i.setQuantidade(itensPedido.getInt("quantidade"));
					i.setPreco(itensPedido.getDouble("preço"));
					l.setTitulo(itensPedido.getString("titulo"));
					l.setValor(itensPedido.getDouble("valor"));
					i.setLivro(l);
					unidade.add(i);
				}
				itensPedido.close();			
				pedido.setUnidade(unidade);
				pedidos.add(pedido);
			}
			pstPedido.close();
			
			
			return pedidos;
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return null;
	}

	@Override
	public void alterar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Pedido p = (Pedido)entidade;
		Integer idPedido = p.getId();
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();

			
			pst = connection.prepareStatement("UPDATE pedido SET  Pstatus='APROVADO'" + 
										" WHERE pedido.id_cliente =" + p.getIDusuario());
			System.out.println(pst);
			pst.executeUpdate();			
			connection.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}

	
