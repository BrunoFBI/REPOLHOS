package MyProject.impl.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;

public class LivroDAO extends AbstractJdbcDAO {
	public LivroDAO() {
		super("Nome", " ID");
		
	}
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst = null;		
		Livro livro = (Livro)entidade;
		try {
			connection.setAutoCommit(false);
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Livros(autor, categoria, subcategoria, ano, titulo, editora, edicao, ISBN, npaginas, sinopse, status) ");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?)");
					
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, livro.getAutor());
			pst.setString(2, livro.getCategoria());
			pst.setString(3, livro.getSubcategoria());
			pst.setString(4, livro.getAno());
			pst.setString(5, livro.getTitulo());
			pst.setString(6, livro.getEditora());
			pst.setString(7, livro.getEdicao());
			pst.setString(8, livro.getISBN());
			pst.setString(9, livro.getNpaginas());
			pst.setString(10, livro.getSinopse());
			pst.setBoolean(11,livro.getStatus());
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
	/** 
	 * TODO Descrição do Método
	 * @param entidade
	 * @see fai.dao.IDAO#alterar(fai.domain.EntidadeDominio)
	 */
	@Override
	public void alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		openConnection();
		PreparedStatement pst = null;
		Livro livro = (Livro)entidade;
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE livros SET autor=?, categoria=?, subcategoria=?, ano=?, titulo=?, editora=?, edicao=?, ISBN=?, nPaginas=?, sinopse=?, status=?"
					+  " WHERE ID_Livro=?");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, livro.getAutor());
			pst.setString(2, livro.getCategoria());
			pst.setString(3, livro.getSubcategoria());
			pst.setString(4, livro.getAno());
			pst.setString(5, livro.getTitulo());
			pst.setString(6, livro.getEditora());
			pst.setString(7, livro.getEdicao());
			pst.setString(8, livro.getISBN());
			pst.setString(9, livro.getNpaginas());
			pst.setString(10, livro.getSinopse());
			pst.setBoolean(11, livro.getStatus());
			pst.setInt(12, livro.getId());
			pst.executeUpdate();			
			connection.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	/** 
	 * TODO Descrição do Método
	 * @param entidade
	 * @return
	 * @see fai.dao.IDAO#consulta(fai.domain.EntidadeDominio)
	 */
	@Override
	
	
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		Livro livro = (Livro) entidade;
		StringBuilder sql = new StringBuilder();


	
		sql.append(
				"SELECT DISTINCT  a.ID_Livro, a.autor,a.categoria,a.subcategoria, a.ano, a.titulo, a.editora, a.edicao, a.isbn,a.npaginas, a.sinopse, a.status");
		sql.append(" FROM livros a ");
		sql.append(" WHERE 1=1 ");
		if (livro.getId() != null && livro.getId() > 0) {
			sql.append(" AND a.ID_Livro = " + livro.getId() );
		}
		if (livro.getTitulo() != null && livro.getTitulo().length() > 0) {
			sql.append(" AND a.titulo like '%" + livro.getTitulo() + "%'");
		}
		if (livro.getAutor() != null && livro.getAutor().length() > 0) {
			sql.append(" AND a.autor like '%" + livro.getAutor() + "%'");
		}
		if (livro.getEdicao() != null && livro.getEdicao().length() > 0) {
			sql.append(" AND a.edicao like '%" + livro.getEdicao() + "%'");
		}
		if (livro.getISBN() != null && livro.getISBN().length() > 0) {
			sql.append(" AND a.isbn like '%" + livro.getISBN() + "%'");
		}
		
		if (livro.getSinopse() != null && livro.getSinopse().length() > 0) {
			sql.append(" AND a.sinopse like '%" + livro.getSinopse() + "%'");
		}
		if (livro.getAno() != null && livro.getAno().length() > 0) {
			sql.append(" and a.ano like '%" + livro.getAno() + "%'");
		}
		if (livro.getEditora() != null && livro.getEditora().length() > 0) {
			sql.append(" and a.editora like '%" + livro.getEditora() + "%'");
		}
		if (livro.getCategoria() != null && livro.getCategoria().length() > 0) {
			sql.append(" and a.categoria like '%" + livro.getCategoria() + "%'");
		}
		if (livro.getSubcategoria() != null && livro.getSubcategoria().length() > 0) {
			sql.append(" and a.subcategoria like '%" + livro.getSubcategoria() + "%'");
		}
		
		
		try {
			openConnection();
			pst = connection.prepareStatement(sql.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> livros = new ArrayList<EntidadeDominio>();
			System.out.println(sql.toString());
			
			
				while(rs.next()){
					Livro l = new Livro();
					l.setId(rs.getInt("ID_Livro"));
					l.setAutor(rs.getString("autor"));
					l.setCategoria(rs.getString("categoria"));
					l.setSubcategoria(rs.getString("subcategoria"));
					l.setAno(rs.getString("ano"));
					l.setTitulo(rs.getString("titulo"));
					l.setEditora(rs.getString("editora"));
					l.setEdicao(rs.getString("edicao"));
					l.setISBN(rs.getString("isbn"));
					l.setNpaginas(rs.getString("npaginas"));
					l.setSinopse(rs.getString("sinopse"));
					l.setStatus(rs.getBoolean("status"));
					livros.add(l);

				}
				return livros;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	}