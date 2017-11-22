package MyProject.web.vh.impl;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MyProject.web.vh.IViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectCore.util.ConverteDatas;
import MyProjectDominio.Cliente;
import MyProjectDominio.Endereco;
import MyProjectDominio.EntidadeDominio;

public class ClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		String operacao = request.getParameter("operacao");
		Cliente cliente = null;

		if(!operacao.equals("VISUALIZAR"))
		{
			String nome = request.getParameter("txtNome");
			String cpf = request.getParameter("txtCpf");
			String genero = request.getParameter("txtGenero");
			String tipotel = request.getParameter("txtTipoTel");
			String telefone = request.getParameter("txtTelefone");
			String email = request.getParameter("txtEmail");
			String senha = request.getParameter("txtSenha");
			String data_Nasc = request.getParameter("txtDtNasc");
			System.out.println(data_Nasc);
			Date dtNascimento;
			dtNascimento =  ConverteDatas.converteStringDate(data_Nasc);
			cliente = new Cliente();
			try {
				int id = Integer.parseInt(request.getParameter("txtId"));
				cliente.setId(id);
			}catch(Exception e){
				
			}
			
			try 
			{
				Boolean status = request.getParameter("rdStatus").equals("true") ? true : false;
				cliente.setStatus(status);
			}catch( Exception e) {
				
			}		
			cliente.setNome(nome);
			cliente.setCpf(cpf);
			cliente.setGenero(genero);
			cliente.setTelefone(telefone);
			cliente.setTipo_tel(tipotel);
			cliente.setEmail(email);
			cliente.setSenha(senha);
			cliente.setDt_nasc(dtNascimento);
			cliente.setDt_Cadastro(dtNascimento);
			return cliente;
		}
		else{
			
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));
			
			for(EntidadeDominio c: resultado.getEntidades()){
				if(c.getId() == txtId){
					cliente = (Cliente)c;
				}
			}
		}
		return cliente;
	}

	/** 
	 * TODO Descri��o do M�todo
	 * @param request
	 * @param response
	 * @return
	 * @see lesWeb.controle.web.vh.IViewHelper#setView(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void setView(Resultado resultado, HttpServletRequest request, 
			HttpServletResponse response)  throws IOException, ServletException {
		RequestDispatcher d=null;
		request.getSession().setAttribute("resultado", null);
		request.getSession().setAttribute("cliente", null);
		
		String operacao = request.getParameter("operacao");
		
		if(resultado.getMsg() == null){
			if(operacao.equals("SALVAR")){
				resultado.setMsg("Cliente cadastrado com sucesso!");
			}
			
			request.getSession().setAttribute("resultado", resultado);
			d= request.getRequestDispatcher("ConsultarCliente.jsp");  			
		}
		
		if(resultado.getMsg() == null && operacao.equals("ALTERAR")){
			
			d= request.getRequestDispatcher("ConsultarCliente.jsp");  
		}
		
		if(resultado.getMsg() == null && operacao.equals("VISUALIZAR")){
			
			request.setAttribute("cliente", resultado.getEntidades().get(0));
			d= request.getRequestDispatcher("ClienteForm.jsp");  
		}
		
		if(resultado.getMsg() == null && operacao.equals("EXCLUIR")){
			
			request.getSession().setAttribute("resultado", null);
			d= request.getRequestDispatcher("ConsultarCliente.jsp");  
		}
		
		if(resultado.getMsg() != null){
			if(operacao.equals("SALVAR") || operacao.equals("ALTERAR")){
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("ConsultarCliente.jsp");  	
			}
		}
		d.forward(request,response);
	}
		
		
		

}