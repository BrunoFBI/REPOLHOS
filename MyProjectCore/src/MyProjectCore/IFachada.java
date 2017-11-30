package MyProjectCore;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public interface IFachada {
		public Resultado salvar(EntidadeDominio entidade);
		public Resultado alterar(EntidadeDominio entidade);
		public Resultado excluir(EntidadeDominio entidade);
		public Resultado consultar(EntidadeDominio entidade);
		public Resultado visualizar(EntidadeDominio entidade);
		public Resultado comprar(EntidadeDominio entidade);
		public Resultado deslogar(EntidadeDominio entidade);
		public Resultado finalizar(EntidadeDominio entidade);
	}


