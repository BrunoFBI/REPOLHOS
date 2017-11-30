package MyProject.web.command.impl;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public class DeslogarCommand extends AbstractCommand {
	public Resultado execute(EntidadeDominio entidade) {
		return fachada.deslogar(entidade);
}
}