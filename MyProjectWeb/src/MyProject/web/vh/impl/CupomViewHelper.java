package MyProject.web.vh.impl;

import java.io.IOException;
import java.util.List;

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
		if (operacao.equals("SALVAR")) {
			System.out.println("Operação no getEntidade: " + operacao);
			String id = request.getParameter("txtId");

			String serial = request.getParameter("txtSerial");
			String desconto = request.getParameter("txtDesconto");
			System.out.println(serial);
			System.out.println(desconto);

			cupom = new Cupom();
			cupom.setDesconto(Double.parseDouble(desconto));
			cupom.setSerial(serial);

			if (id != null && !id.trim().equals("")) {
				cupom.setId(Integer.parseInt(id));
			}
			return cupom;
		}
		
		if(operacao.equals("BUSCAR")) {
			Cupom c = new Cupom();
			return c;
		}
		
		if(operacao.equals("CUPONIZAR")) {
			String serial = request.getParameter("txtCupom");
			Cupom c = new Cupom();
			System.out.println(serial);
			c.setSerial(serial);
			return c;
		}
		return null;
	}

	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		RequestDispatcher d = null;

		String operacao = request.getParameter("operacao");

		if (resultado.getMsg() == null) {
			if (operacao.equals("SALVAR")) {
				resultado.setMsg("Cupom cadastrado com sucesso!");
			}

			request.getSession().setAttribute("resultado", resultado);
			d = request.getRequestDispatcher("ConCupom.jsp");
		}

			if(operacao.equals("CUPONIZAR")) {
				System.out.println("E ai mano entrei na Operação");
				List<EntidadeDominio> entidades = resultado.getEntidades();
				for (int i = 0; i < entidades.size(); i++) {
					Cupom cupom = (Cupom) entidades.get(i);
					if(request.getParameter("txtCupom").trim().equals(cupom.getSerial()))
					{
						System.out.println("entrei no if");
						HttpSession sessao = request.getSession();
						sessao.setAttribute("cupom", cupom);
						request.getSession().setAttribute("resultadoCupom", resultado);
						d = request.getRequestDispatcher("Carrinho.jsp");
						break;
					}else {
						resultado.setMsg("Este cupon não esta registrado!");
						request.getSession().setAttribute("resultadoCupom", resultado);
						d = request.getRequestDispatcher("Carrinho.jsp");


					}
					
					
				}
				
			}
			
			if (operacao.equals("BUSCAR")) {
				List<EntidadeDominio> entidades = resultado.getEntidades();
				for (int i = 0; i < entidades.size(); i++) {
					
					Cupom cupom = (Cupom) entidades.get(i);
					request.getSession().setAttribute("resultado", resultado);
					d = request.getRequestDispatcher("ConCupom.jsp");
					System.out.println("cvccc");

				}
			}
			
			d.forward(request, response);
		}

	}
	

