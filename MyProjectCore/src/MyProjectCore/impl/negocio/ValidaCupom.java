package MyProjectCore.impl.negocio;

import java.util.Calendar;
import java.util.Date;

import MyProjectCore.IStrategy;
import MyProjectCore.util.Autenticador;
import MyProjectDominio.Cupom;
import MyProjectDominio.EntidadeDominio;

public  class ValidaCupom implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Cupom cu = (Cupom) entidade;
		Autenticador.setCupo(cu);
		Cupom c = (Cupom) Autenticador.buscar();
		
			if(c == null)
			{
				System.out.println("O Cupom digitado não consta em nossa base de dados");
				return "O Cupom digitado não consta em nossa base de dados";
				
			}
			
			Date dtExp = c.getDtVal();
			Calendar cal = Calendar.getInstance();
			Date dtHoje = cal.getTime();
					
			if(dtExp.before(dtHoje))
			{
				
				System.out.println("O Cupom digitado expirou");	
				
				return "O cupom inserido esta expirado";
			}		
		
		
		return null;
	}

}