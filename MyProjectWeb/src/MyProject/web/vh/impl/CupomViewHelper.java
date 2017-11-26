package MyProject.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MyProject.web.vh.IViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Cupom;

public class CupomViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		String operacao = request.getParameter("operacao");
		Cupom cupom = null;
		if(!operacao.equals("VISUALIZAR"))
		{
			System.out.println("Operação no getEntidade: " + operacao);
			String id = request.getParameter("txtId");
			String serial = request.getParameter("txtSerial");
			double desconto = Double.parseDouble(request.getParameter("txtDesconto"));
			
			cupom = new Cupom();
			cupom.setDesconto(desconto);
			cupom.setSerial(serial);
			
			if (id != null && !id.trim().equals("")) {
				cupom.setId(Integer.parseInt(id));
			}
		}
		else{
			
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));
			int txtSerial = Integer.parseInt(request.getParameter("txtSerial"));
			int txtDesconto =Integer.parseInt(request.getParameter("txtDesconto")); 
			for (EntidadeDominio c : resultado.getEntidades()) {
				if (c.getId() == txtId) {
					cupom = (Cupom) c;
				}
			}
		}
			return cupom;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		RequestDispatcher d=null;
		request.getSession().setAttribute("resultado", null);
		request.getSession().setAttribute("livro", resultado);
		
		String operacao = request.getParameter("operacao");
		
		if(resultado.getMsg() == null){
			if(operacao.equals("SALVAR")){
				resultado.setMsg("Cupom cadastrado com sucesso!");
			}
			
			request.getSession().setAttribute("resultado", resultado);
			d= request.getRequestDispatcher("ConCupom.jsp");  			
		}
		
		if(resultado.getMsg() == null && operacao.equals("ALTERAR")){
			
			d= request.getRequestDispatcher("ConCupom.jsp");  
		}
		
		if(resultado.getMsg() == null && operacao.equals("VISUALIZAR")){
			
			request.setAttribute("livro", resultado.getEntidades().get(0));
			d= request.getRequestDispatcher("Cupom.jsp");  			
		}
		
		if(resultado.getMsg() == null && operacao.equals("EXCLUIR")){
			
			request.getSession().setAttribute("resultado", null);
			d= request.getRequestDispatcher("ConCupom.jsp");  
		}
		
		if(resultado.getMsg() != null){
			if(operacao.equals("SALVAR") || operacao.equals("ALTERAR")){
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("ConCupom.jsp");  	
			}
		}

		d.forward(request, response);
	}
	
}
