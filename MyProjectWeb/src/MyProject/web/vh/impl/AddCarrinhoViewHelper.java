
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
		
		Livro l = (Livro) request.getSession().getAttribute("livro");
		Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>)request.getSession().getAttribute("mapaUsuarios");
		Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
		String operacao = (String)request.getParameter("operacao");		
		
		String stringId = (String)request.getSession().getAttribute("userid");
			
		if(mapaUsuarios == null)
		{
			mapaUsuarios = new HashMap<Integer, Pedido>();
			Pedido p = new Pedido();
			p.setUnidade(new ArrayList<Unidade>());
			Unidade i = new Unidade();
			i.setLivro(l);
			i.setQuantidade(1);
			p.getUnidade().add(i);
			int idUsuario = Integer.parseInt(stringId);
			mapaUsuarios.put(idUsuario, p);
			return i;
		}
		
		//  Operação para remover itens no carrinho de acordo com a ID de uma txt "hidden"
		if(m != null && operacao.equals("REMOVER"))
		{
			System.out.println("estou aquiiiiii");
			String txtId = request.getParameter("id");
			int id = Integer.parseInt(txtId);

			m.remove(id, m.get(id));
			for(int i = 0; i < BookList.size(); i ++)
			{
				if(BookList.get(i).getId() == id)
				{
					BookList.remove(i);
					break;
				}
			}
				request.getSession().setAttribute("livros", BookList);
				request.getSession().setAttribute("mapCar", m);		
				return new Unidade();
		}
		
		if(operacao.equals("MUDAR"))
		{
			System.out.println("estou aquiiiiii");
			int txtId =  Integer.parseInt(request.getParameter("id"));
			int txtqtd =  Integer.parseInt(request.getParameter("qtde"));
		}
		
		if(BookList != null)
		{
			if(m.containsKey(l.getId()))
			{
				m.put(l.getId(), m.get(l.getId()) + 1);
				request.getSession().setAttribute("mapCar", m);
			}
			if(!m.containsKey(l.getId()))
			{
				BookList.add(l);
				m.put(l.getId(), 1);
				request.getSession().setAttribute("livros", BookList);
				request.getSession().setAttribute("mapCar", m);	
			}
			return new Unidade();
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
			System.out.println("heeeeeeeeey");
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
							p.getItem().get(indice).setQtde(p.getUnidade().get(indice).getQtde() + 1);
						
						mapaUsuarios.replace(id, p);  
						request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
					}
				}//if contains key
				
				if(!mapaUsuarios.containsKey(id))
				{
					List<EntidadeDominio> e = resultado.getEntidades();  //pegando o resultado que retorna da fachada

					Item item = (Item)e.get(0);//pega o único item que retornou da fachada
					Pedido p = mapaUsuarios.get(id); //pega o pedido que está associado com a id do usuário
					
					if(p == null)
					{
						p = new Pedido();
					}
					
					p.setItem(new ArrayList<Item>()); 
					p.getItem().add(item);  
					
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
		}
		if (operacao.equals("MUDAR")){
			System.out.println("heeeeeeeeey");
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		
		
		
		d.forward(request, response);

	}
	
	
}
