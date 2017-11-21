package MyProject.web.command.impl;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public class ExcluirCommand extends AbstractCommand{
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.excluir(entidade);
	}

}
