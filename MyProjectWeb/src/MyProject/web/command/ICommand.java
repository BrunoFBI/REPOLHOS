package MyProject.web.command;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public interface ICommand {
	public Resultado execute(EntidadeDominio entidade);
}
