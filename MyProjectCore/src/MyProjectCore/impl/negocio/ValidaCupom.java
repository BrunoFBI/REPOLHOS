package MyProjectCore.impl.negocio;

import java.util.Calendar;
import java.util.Date;

import MyProjectCore.IStrategy;
import MyProjectDominio.Cupom;
import MyProjectDominio.EntidadeDominio;

public  class ValidaCupom implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		Cupom c = (Cupom)entidade;
		System.out.println(" sou o id e estou nulo" + c.getId());
		
			if(c.getSerial() == null)
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