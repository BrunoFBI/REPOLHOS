package MyProject.web.vh.impl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MyProject.web.vh.IViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.Cartao;
import MyProjectDominio.Cliente;
import MyProjectDominio.Endereco;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Pedido;

public class FinalPedidoWiewHelper implements IViewHelper{

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		
		
		String operacao = request.getParameter("operacao");
		Cliente c = (Cliente) request.getSession().getAttribute("usuario");
		System.out.println( "sou O  " + c.getNome() );
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("userid");
		int id = Integer.parseInt(txtId);
		System.out.println( "sou OP: " + id );
		
		
		if(operacao.equals("FINALIZAR")) {
		Pedido p = map.get(id);
		System.out.println( "sou OP" + p );
		Calendar ca = Calendar.getInstance();
		Date dt = ca.getTime();
		p.setDtPedido(dt);
		System.out.println("Pedido:" + p.getDtPedido());
		p.setStatus("EM PROCESSO");
		System.out.println("Pedido:" + p.getStatus());
		p.setIDusuario(c.getId());
		int Endid = Integer.parseInt(request.getParameter("idbacana"));
		Endereco ID = c.getEndereco().get(Endid);
		double ptotal = Double.parseDouble(request.getParameter("precototal"));
		p.setPrecoTotal(ptotal);
		p.setEndereco(ID);
			return p;
		}

		if(operacao.equals("CHECKOUT")) {
			Pedido p = map.get(id);
			double ptotal = Double.parseDouble(request.getParameter("idCart"));
			p.setPrecoTotal(ptotal);
				return p;
			}
		
		
		Pedido ped = new Pedido();
		return ped;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("userid");
		int id = Integer.parseInt(txtId);
		Cliente c = (Cliente) request.getSession().getAttribute("usuario");

		ArrayList<Integer> indices = new ArrayList();
		RequestDispatcher d = null;
		String pedShow = (String) request.getSession().getAttribute("pedShow");
		String operacao = request.getParameter("operacao");
		
		if(operacao.equals("FINALIZAR")) {
			
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("FinalPedido.jsp");  

		}
		if(operacao.equals("CHECKOUT")) {
			
			request.getSession().setAttribute("resultado", resultado);
			d= request.getRequestDispatcher("FinalPedido.jsp");  

	}
		
		d.forward(request, response);
	}

}
