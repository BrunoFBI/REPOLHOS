package MyProject.web.command.impl;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public class VisualizarCommand extends AbstractCommand{
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.visualizar(entidade);
	}

}