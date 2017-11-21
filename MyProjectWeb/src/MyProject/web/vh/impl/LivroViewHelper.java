package MyProject.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProject.web.vh.IViewHelper;

public class LivroViewHelper implements IViewHelper{
	/** 
	 * TODO Descrição do Método
	 * @param request
	 * @param response
	 * @return
	 * @see lesWeb.vh.IViewHelper#getEntidade(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		String operacao = request.getParameter("operacao");
		Livro livro = null;
		if(!operacao.equals("VISUALIZAR"))
		{
			System.out.println("Operação no getEntidade: " + operacao);
			String id = request.getParameter("txtId");
			String autor = request.getParameter("txtAutor");
			String categoria = request.getParameter("txtCategoria");
			String subcategoria = request.getParameter("txtSubCategoria");
			String ano = request.getParameter("txtAno");
			String titulo = request.getParameter("txtTitulo");
			String editora = request.getParameter("txtEditora");
			String edicao = request.getParameter("txtEdicao");
			String isbn = request.getParameter("txtISBN");
			String npaginas = request.getParameter("txtPaginas");
			String sinopse = request.getParameter("txtSinopse");
			livro = new Livro();
			try 
			{
				Boolean status = request.getParameter("rdStatus").equals("true") ? true : false;
				livro.setStatus(status);
			}catch( Exception e) {
				
			}
			
			livro.setAutor(autor);
			livro.setCategoria(categoria);
			livro.setSubcategoria(subcategoria);
			livro.setAno(ano);
			livro.setTitulo(titulo);
			livro.setEditora(editora);
			livro.setEdicao(edicao);
			livro.setISBN(isbn);
			livro.setNpaginas(npaginas);
			livro.setSinopse(sinopse);
		
			if (id != null && !id.trim().equals("")) {
				livro.setId(Integer.parseInt(id));
			}
		}
		else{
			
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));
			for (EntidadeDominio l : resultado.getEntidades()) {
				if (l.getId() == txtId) {
					livro = (Livro) l;
				}
			}
		}
			return livro;
		}
	/** 
	 * TODO Descrição do Método
	 * @param request
	 * @param response
	 * @return
	 * @see lesWeb.controle.web.vh.IViewHelper#setView(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void setView(Resultado resultado, HttpServletRequest request, 
			HttpServletResponse response)  throws IOException, ServletException {
		RequestDispatcher d=null;
		request.getSession().setAttribute("resultado", null);
		request.getSession().setAttribute("livro", resultado);
		
		String operacao = request.getParameter("operacao");
		
		if(resultado.getMsg() == null){
			if(operacao.equals("SALVAR")){
				resultado.setMsg("Livro cadastrado com sucesso!");
			}
			
			request.getSession().setAttribute("resultado", resultado);
			d= request.getRequestDispatcher("Consultar.jsp");  			
		}
		
		if(resultado.getMsg() == null && operacao.equals("ALTERAR")){
			
			d= request.getRequestDispatcher("Consultar.jsp");  
		}
		
		if(resultado.getMsg() == null && operacao.equals("VISUALIZAR")){
			
			request.setAttribute("livro", resultado.getEntidades().get(0));
			d= request.getRequestDispatcher("FormBooks.jsp");  			
		}
		
		if(resultado.getMsg() == null && operacao.equals("EXCLUIR")){
			
			request.getSession().setAttribute("resultado", null);
			d= request.getRequestDispatcher("Consultar.jsp");  
		}
		
		if(resultado.getMsg() != null){
			if(operacao.equals("SALVAR") || operacao.equals("ALTERAR")){
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("Consultar.jsp");  	
			}
		}
		System.out.print(operacao);
		if(operacao.equals("CONSULTARLIVRO")){
			request.getSession().setAttribute("resConsultaLivro", resultado);
			d= request.getRequestDispatcher("Index.jsp");  
			System.out.println("Consultaaaaaaaaaa");
		}
		if(operacao.equals("MOSTRAR")) {
			request.getSession().setAttribute("resCompra", resultado);
			d= request.getRequestDispatcher("PaginaLivro.jsp");
		}

		d.forward(request, response);
	}
	
}
