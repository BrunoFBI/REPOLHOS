package MyProject.web.command.impl;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public class AlterarCommand extends AbstractCommand{

public Resultado execute(EntidadeDominio entidade) {
		
		return fachada.alterar(entidade);
	}
}