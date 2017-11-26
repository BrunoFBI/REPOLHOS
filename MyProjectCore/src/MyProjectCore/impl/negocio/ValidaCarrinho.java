package MyProjectCore.impl.negocio;

import MyProjectCore.IStrategy;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProjectDominio.Unidade;

public class ValidaCarrinho implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		System.out.println("Entrei na regra de negooooooooooooooooocio");
		Unidade itemCarrinho = (Unidade)entidade;
		Livro l = itemCarrinho.getLivro();
		System.out.println("isso aqui esta: "+l.getQuantidade());
		System.out.println("isso aqui esta: "+ itemCarrinho.getQuantidade());
		if(l.getQuantidade() == 0)
		{
			return " Item Indisponivel";
		}
		if(itemCarrinho.getQuantidade() > l.getQuantidade())
		{
			System.out.println(" é maior que o estoque");
			return "Não há mais livros disponíveis no estoque";
		}
		return null;
	}

}
