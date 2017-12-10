package MyProject.web.vh.impl;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MyProject.web.vh.IViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectCore.util.ConverteDatas;
import MyProjectDominio.Cartao;
import MyProjectDominio.Cliente;
import MyProjectDominio.Endereco;
import MyProjectDominio.EntidadeDominio;

public class CartaoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		Cliente cu = (Cliente) request.getSession().getAttribute("usuario");	
		String operacao = request.getParameter("operacao");
		Cartao cartao = null;

		if(!operacao.equals("VISUALIZAR"))
		{
			String titular = request.getParameter("txtTitular");
			String codigo = request.getParameter("txtCodigo");
			String numero = request.getParameter("txtNumero");
			String bandeira = request.getParameter("txtBandeira");
			String validade = request.getParameter("txtValidade");
			cartao = new Cartao();
			
			int id = cu.getId();
			cartao.setID_Cliente(id);
			cartao.setTitular(titular);
			cartao.setCodigo(codigo);
			cartao.setNumero(numero);
			cartao.setBandeira(bandeira);
			cartao.setValidade(validade);
			
			Cliente cli = (Cliente) request.getSession().getAttribute("usuario");
			cli.getCartao().add(cartao);
			return cartao;
		}
else{
			
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));
			
			for(EntidadeDominio c: resultado.getEntidades()){
				if(c.getId() == txtId){
					cartao = (Cartao)c;
				}
			}
		}
		return cartao;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		RequestDispatcher d= null;
		request.getSession().setAttribute("resultado", null);
		request.getSession().setAttribute("cartao", null);
		
		String operacao = request.getParameter("operacao");
		
		if(resultado.getMsg() == null){
			if(operacao.equals("CADASTRAR")){
				resultado.setMsg("Cartão cadastrado com sucesso!");
			}
			request.getSession().setAttribute("resultado", resultado);
					d = request.getRequestDispatcher("FinalPedido.jsp");
					d.forward(request, response);
					return;
				}
				else {
					d = request.getRequestDispatcher("Index.jsp");
				} 			
		}
		
	}
	


