package MyProjectCore.util;

import java.util.List;

import MyProjectDominio.Cupom;
import MyProjectDominio.EntidadeDominio;

public class Autenticador {
	private static Cupom cupo;
	private static List<EntidadeDominio> entidades;
	
	public static void setEntidades(List<EntidadeDominio> entidade) {
		entidades = entidade;
		
	}

	public static Cupom getCupo() {
		return cupo;
	}

	public static void setCupo(Cupom cupom) {
		cupo = cupom;
	}

	public static EntidadeDominio buscar () {
		
		for(int i = 0; i < entidades.size(); i++) {
			Cupom cupom = (Cupom) entidades.get(i);
			
			if(cupom.getSerial().trim().equals(cupo.getSerial())) {
				return cupom;
			}
			
		}
		return null;
	}	
}
