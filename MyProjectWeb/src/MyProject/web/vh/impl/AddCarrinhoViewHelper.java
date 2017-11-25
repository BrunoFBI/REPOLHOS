package MyProject.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MyProject.web.vh.IViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProjectDominio.Pedido;
import MyProjectDominio.Unidade;

public class AddCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		
		request.getSession().setAttribute("userid", "0");
		String stringId = (String)request.getSession().getAttribute("userid");
		Livro l = (Livro) request.getSession().getAttribute("livro");
		Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>)request.getSession().getAttribute("mapaUsuarios");
		Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
		String operacao = (String)request.getParameter("operacao");		
			
		if(mapaUsuarios == null)
		{
			mapaUsuarios = new HashMap<Integer, Pedido>();
			Pedido p = new Pedido();
			p.setUnidade(new ArrayList<Unidade>());
			Unidade u = new Unidade();
			u.setLivro(l);
			u.setQuantidade(1);
			p.getUnidade().add(u);
			int idUsuario = Integer.parseInt(stringId);
			mapaUsuarios.put(idUsuario, p);
			return u;
		}
		
		
		
		//  Operação para remover itens no carrinho de acordo com a ID de uma txt "hidden"
				
		if(operacao.equals("MUDAR"))
		{
			System.out.println("Entrei no Mudar");
			String txtIdUsuario = (String) request.getSession().getAttribute("userid");
			int idUsuario = Integer.parseInt(txtIdUsuario);
			String txtIdLivro = request.getParameter("id");
			int idLivro = Integer.parseInt(txtIdLivro);
			Pedido p = mapaUsuarios.get(idUsuario);
			Livro book;
			Unidade u = new Unidade();
			for (int i = 0; i < p.getUnidade().size(); i++) {
				if (p.getUnidade().get(i).getLivro().getId() == idLivro) {
					book = p.getUnidade().get(i).getLivro();
					u = p.getUnidade().get(i);

				}
			}

			return u;
		}
		
			
		
		
		
		if(mapaUsuarios != null)
		{
			Unidade u = new Unidade();
			u.setQuantidade(1);
			u.setLivro(l);
			return u;
		}
		
		return new Unidade();
	}


	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		RequestDispatcher d = null;
		String operacao = request.getParameter("operacao");
		request.getSession().removeAttribute("resultadoConsultaLivro");
		String stringId = (String)request.getSession().getAttribute("userid");
		
		if (operacao.equals("REMOVER")){
			System.out.println("Entrei no remover");
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		
		if (operacao.equals("COMPRAR")) {
			Livro l = (Livro) request.getSession().getAttribute("livro");
			//Map<Integer, Integer> m = (Map<Integer, Integer>)request.getSession().getAttribute("mapaCarrinho");
			Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");

			
			String txtId = (String)request.getSession().getAttribute("userid");
			Integer id = Integer.parseInt(txtId);
			if(mapaUsuarios == null)
			{
				mapaUsuarios = new HashMap<Integer, Pedido>();
			}

			String msg1 = "Nao ha mais livros restantes no estoque";
			msg1.trim();
			if(resultado.getMsg() == null || resultado.getMsg().trim().equals(msg1))
			{
				if(mapaUsuarios.containsKey(id)) //se o usuário já existe
				{
					List<EntidadeDominio> e = resultado.getEntidades();  //pegando o resultado que retorna da fachada
													
					Unidade unidade = (Unidade)e.get(0);//pega o único item que retornou da fachada
					Pedido p = mapaUsuarios.get(id); //pega o pedido que está associado com a id do usuário
					List<Integer> listaIds= new ArrayList<Integer>();
					int indice = 0;
					if(p.getUnidade().size() == 0)      //se não existe uma lista de itens no pedido
					{
						p.setUnidade(new ArrayList<Unidade>()); 
						p.getUnidade().add(unidade);  
					}
					else
					{
						for(int i = 0; i < p.getUnidade().size(); i++)
						{
							if(unidade.getLivro().getId() == p.getUnidade().get(i).getLivro().getId())
								indice = i;
							
							listaIds.add(p.getUnidade().get(i).getLivro().getId()); 
						}
						
						if(!listaIds.contains(unidade.getLivro().getId()))
							p.getUnidade().add(unidade); 
						else
							p.getUnidade().get(indice).setQuantidade(p.getUnidade().get(indice).getQuantidade() + 1);
						
						mapaUsuarios.replace(id, p);  
						request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
					}
				}//if contains key
				
				if(!mapaUsuarios.containsKey(id))
				{
					List<EntidadeDominio> e = resultado.getEntidades();  //pegando o resultado que retorna da fachada

					Unidade unidade = (Unidade)e.get(0);//pega o único item que retornou da fachada
					Pedido p = mapaUsuarios.get(id); //pega o pedido que está associado com a id do usuário
					
					if(p == null)
					{
						p = new Pedido();
					}
					
					p.setUnidade(new ArrayList<Unidade>()); 
					p.getUnidade().add(unidade);  
					
					if(mapaUsuarios.size() == 0 || !mapaUsuarios.containsKey(id))
					{
						mapaUsuarios.put(id, p);  
					}
					else
					{
						mapaUsuarios.replace(id, p); 
					}
					request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
				} // if !containsKey
			}// if getMsg == null
			
			
			//request.getSession().setAttribute("livros", livros);
			request.getSession().setAttribute("resultadoLivro", resultado);
			//request.getSession().setAttribute("mapaResultado", mapaResultado);
			
			d= request.getRequestDispatcher("Carrinho.jsp");  
		} //operacação == VERIFICAR
		
		if (operacao.equals("MUDAR")){
			System.out.println("Entrei no Mudar");
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			String txtIdLivro = request.getParameter("id");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String) request.getSession().getAttribute("userid");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);
			if (resultado.getMsg() == null) {
				for (int i = 0; i < p.getUnidade().size(); i++) {
					Livro l = p.getUnidade().get(i).getLivro();
					if (l.getId() == idLivro) {
					
						int txtqtd =  Integer.parseInt(request.getParameter("qtde"));
						p.getUnidade().get(i).setQuantidade(txtqtd);
						System.out.println(" Quantidade: " + txtqtd);
						break;
					}
				}

				mapaUsuarios.replace(idUsuario, p);
				request.getSession().setAttribute( "mapaUsuarios", mapaUsuarios);
			}
			
			if (resultado.getMsg() != null) {
				System.out.println("Não Nulo");
				List<EntidadeDominio> ed = resultado.getEntidades();
				Unidade unidade = (Unidade) ed.get(0);
				p = mapaUsuarios.get(idUsuario);
				Integer qtdeLivrosRestantes = unidade.getQuantidade();
				System.out.println("oia "+ qtdeLivrosRestantes);
				for (int i = 0; i < p.getUnidade().size(); i++) {
					Livro l = p.getUnidade().get(i).getLivro();
					if (l.getId() == idLivro) {
						if (operacao.equals("MUDAR") && qtdeLivrosRestantes >= p.getUnidade().get(i).getQuantidade()) {
							
							Integer qtdeLivro = p.getUnidade().get(i).getQuantidade();
							p.getUnidade().get(i).setQuantidade(1);
						} 

						break;
					}
				}

				mapaUsuarios.replace(idUsuario, p);

			}
			
			request.getSession().setAttribute("resultadoLivro", resultado);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			d = request.getRequestDispatcher("Carrinho.jsp");

		}
		
		if (operacao.equals("REMOVER")) {
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			String txtIdLivro = (String) request.getParameter("id");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String) request.getSession().getAttribute("userid");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);

			for (int i = 0; i < p.getUnidade().size(); i++) {
				Livro l = p.getUnidade().get(i).getLivro();
				if (l.getId() == idLivro) {
					p.getUnidade().remove(i);
					break;
				}
			}

			mapaUsuarios.replace(idUsuario, p);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			request.getSession().setAttribute("resultadoLivro", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");

		}

		d.forward(request, response);

	}

}