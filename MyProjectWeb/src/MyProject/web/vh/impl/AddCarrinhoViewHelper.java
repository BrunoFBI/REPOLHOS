
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
import MyProjectDominio.Unidade;

public class AddCarrinhoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		
		Livro l = (Livro) request.getSession().getAttribute("livro");
		List<Livro> BookList = (List<Livro>) request.getSession().getAttribute("livros"); 
		Map<Integer, Integer> m = (Map<Integer, Integer>)request.getSession().getAttribute("mapCar");
		
		String operacao = (String)request.getParameter("operacao");

			
		if(BookList == null)
		{
			Map<Integer, Integer> mapLivros = new HashMap<Integer, Integer>();
			List<Livro> livros = new ArrayList<Livro>();
			livros.add(l);
			request.getSession().setAttribute("livros", livros);
			mapLivros.put(l.getId(), 1);
			request.getSession().setAttribute("mapCar", mapLivros);
			return new Unidade();
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
		
		if (operacao.equals("REMOVER")){
			System.out.println("heeeeeeeeey");
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		
		if (operacao.equals("COMPRAR")) {
			request.getSession().setAttribute("resultadoLivro", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		if (operacao.equals("MUDAR")){
			System.out.println("heeeeeeeeey");
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		
		
		
		d.forward(request, response);

	}
	
	
}
