package MyProjectCore.impl.negocio;

import MyProjectCore.IStrategy;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProjectDominio.Unidade;

public class ValidaCarrinho implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		
		Unidade itemCarrinho = (Unidade)entidade;
		Livro l = itemCarrinho.getLivro();
		System.out.println(l.getTitulo());
		if(l.getQuantidade() == 0)
		{
			return " Item Indisponivel";
		}
		if(itemCarrinho.getQuantidade() >= l.getQuantidade())
		{
			return "N�o h� mais livros dispon�veis no estoque";
		}
		return null;
	}

}
