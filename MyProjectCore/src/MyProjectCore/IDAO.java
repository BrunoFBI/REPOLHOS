package MyProjectCore;

import java.sql.SQLException;
import java.util.List;

import MyProjectDominio.EntidadeDominio;

public interface IDAO {
	public void salvar(EntidadeDominio entidade) throws SQLException;
	public void alterar(EntidadeDominio entidade) throws SQLException;
	public void excluir(EntidadeDominio entidade)throws SQLException;
	List<EntidadeDominio> consultar(EntidadeDominio entidade)throws SQLException;
}