package MyProjectCore;

import MyProjectDominio.EntidadeDominio;

public interface IStrategy {
	public String processar(EntidadeDominio entidade);
}
