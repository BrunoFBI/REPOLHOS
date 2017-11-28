<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Seu carrinho</title>
<script>
	
	function Redirecionar(qtde,id){
	window.location.href = "SalvarCarrinho?operacao=MUDAR&qtde=" + qtde + "&id=" + id;
	document.getElementById("numerim").value = qtde;
}	
</script>
</head>
<body>

<%
String stringId = (String) request.getSession().getAttribute("userid");
Cupom cup = (Cupom) request.getSession().getAttribute("cupom");
if (stringId != null) {
	if (!stringId.trim().equals("0")) {
		if (request.getSession().getAttribute("usuariodeslogado") != null) {
			Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession() .getAttribute("mapaUsuarios");
			Pedido p = mapaUsuarios.get(0);
			mapaUsuarios.put(Integer.parseInt(stringId), p);
			mapaUsuarios.remove(0);
			request.getSession().removeAttribute("usuariodeslogado");
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
		}
	}
}
if (request.getSession().getAttribute("redirecionar") == null) {
	request.getSession().setAttribute("redirecionar", "1");
	response.sendRedirect("Carrinho.jsp");
	return;
}
request.getSession().setAttribute("redirecionar", null);
Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
Resultado cupom = (Resultado) request.getSession().getAttribute("resultadoCupom");
Resultado res = (Resultado) request.getSession().getAttribute("resultadoLivro");
List<Unidade> unidade = new ArrayList<Unidade>();
String usuario = (String) request.getSession().getAttribute("username");
%>
<%
	Cliente cli = (Cliente) session.getAttribute("usuario");	
	if (cli != null) {
		GregorianCalendar calendar = new GregorianCalendar();
		int hora = calendar.get(Calendar.HOUR_OF_DAY);
		if (hora < 6) {
			out.print("Boa Madruga, " + cli.getNome());
		} else if (hora < 12) {
			out.print("Bom Dia, " + cli.getNome());
		} else if (hora < 18) {
			out.print("Boa Tarde, " + cli.getNome());
		} else if (hora < 23) {
			out.print("Boa Noite, " + cli.getNome());
		}

	}
%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="http://localhost:8080/MyProjectWeb/Index.jsp">Hyper Books</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Sobre</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Serviços</a>
            </li>
              <%
              	if(cli == null)
              	{
              		StringBuilder sb = new StringBuilder();
              		sb.append("<li class='nav-item'>");
              		sb.append(" <a class='nav-link' href='http://localhost:8080/MyProjectWeb/Login.jsp'>");
              		sb.append("Login");
              		 out.print(sb.toString());
              	}
              	else{
              		StringBuilder sb = new StringBuilder();
              		sb.append("<li class='nav-item'>");
              		sb.append(" <a class='nav-link' href='DeslogarCliente?operacao=DESLOGAR'>");
              		sb.append("Logout");
              		 out.print(sb.toString());
              	}
              %>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/MyProjectWeb/SalvarCarrinho">Carrinho</a>
              
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <br><br><br>
	<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-striped table-dark"">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Preço</th>
                        <th style="padding-left:84px;">Total</th>
                        <%
									if (res != null) {
										if (res.getMsg() == null) {
											out.print("<td> </td>");
										}else
											out.print(res.getMsg());
									}
						%>
                    </tr>
                </thead>
               <%
               	double subTotal = 0;;
				double precoTotal = 0;
				double precoFrete = 0;
				double totalzao = 0;
				double full = 0;
				if (map != null) {
					String txtId = (String) request.getSession().getAttribute("userid");
					int id = Integer.parseInt(txtId);
					//Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
					StringBuilder sb = new StringBuilder();
					Pedido p = map.get(id);
					unidade = p.getUnidade();
					
					if (unidade.size() != 0) {
						for (int i = 0; i < unidade.size(); i++) {
							sb.setLength(0);
							Unidade uni = unidade.get(i);
							Livro l = uni.getLivro();
							sb.append("<tbody>");
                            sb.append("<tr>");
                            sb.append("<td class='col-sm-8 col-md-6'>");
                            sb.append("<div class='media'>");                                   
                            sb.append("<div class='media-body'>");    
                            sb.append("<h4 class='media-heading'><a href='#''>");
                            sb.append(l.getTitulo());                
                            sb.append("</a></h4>");
                            sb.append("</div>");
                            sb.append("</div></td>");
                         // Pega titulo do livro na lista
                            sb.append("<td data-th='Quantity'>");
                            sb.append("<input type='number' max='"+ l.getQuantidade() + "' min='1' class='form-control' value='" + uni.getQuantidade() + "' id='numerim' onchange='Redirecionar(this.value,"+ l.getId()+")'>");
                         // input qye chama a função de redirecionamento cada vez que é alterada   
                            sb.append("</td>");
                            sb.append("</td>");
                            sb.append("<td class='col-sm-1 col-md-1 text-center'><strong>"); 
                            sb.append(l.getValor());
                            System.out.println(l.getValor());
                            sb.append("<td class='col-sm-1 col-md-1 text-center'><strong>");
                            sb.append(l.getValor() * uni.getQuantidade());
                            sb.append("</strong></td>");
                            sb.append("<td class='col-sm-1 col-md-1'>");
                            sb.append("<a href='SalvarCarrinho?operacao=REMOVER&id=" + l.getId() +"'>");
                            sb.append("<button class='btn btn-danger'>REMOVER</button>");
                            sb.append("</a>");                                    
                            sb.append("</td>"); 
                            sb.append("</tr>");       
                            sb.append("</tbody>");
                            totalzao = l.getValor() * uni.getQuantidade();
                            precoTotal = totalzao + precoTotal;
                            precoFrete  = (unidade.get(i).getLivro().getId() * 9) / 2; 
                            out.print(sb.toString());
                            /////////////////////////////////////////////////////////////////
                            						
						} 
							
						
					}
				}
               %>  
               <%
                 	if (map != null) {
                 			String txtId = (String) request.getSession().getAttribute("userid");
                 			int id = Integer.parseInt(txtId);
                 			//Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
                 			StringBuilder sb = new StringBuilder();
                 			Pedido p = map.get(id);
                 			unidade = p.getUnidade();
                 	    						p.setPrecoFrete(precoFrete);
                 	    						p.setPrecoTotal(precoTotal + precoFrete);
                 	    						p.setTotalDesconto(p.getPrecoTotal());
                 	    						request.getSession().setAttribute("mapaCarrinho", map);   
                 	    						 					
                 	    						if(cup != null){
                 	    							p.setTotalDesconto(p.getPrecoTotal() - cup.getDesconto());  
                 	    							if(p.getTotalDesconto() < 0){
                 	    								p.setTotalDesconto(0);
                 	    							}
                 	    						}	
                 	    						sb.append("<tfoot>");
                 	    			               sb.append(" <tr>"); 
                 	    			               sb.append(" <td><h5>Total<br>Frete</h5><h3>Final</h3></td>");
                 	    			               sb.append("<td class='text-right'><h5><strong>");
                 	    			               sb.append(p.getPrecoTotal()+ "<br>");
                 	    			               sb.append(p.getPrecoFrete());  
                 	    			               sb.append("</strong></h5><h3>");
                 	    			               sb.append(p.getTotalDesconto() + p.getPrecoFrete());
                 	    			               sb.append("</h3></td>");  
                 	    			              out.print(sb.toString());
                                }
                 %>          
                    </tr>
                    <tr>               	
                    	<form action="SalvarCupom" method="post">
	                         <td>
	                           <input  type="submit" id="operacao" name="operacao" value="CUPONIZAR" class="btn btn-success"/></td>
                        	</td>
                        	<td>
                        		<input type="text" id="txtCupom" name="txtCupom" style="margin-right: 30px">
                        	</td>
                        </form>
                        
                        <td></td>                       
                        <td>
                        <a href="http://localhost:8080/MyProjectWeb/Index.jsp" type="button" class="btn btn-default">
                         Continuar Comprando
                        </a>
                        </td>
                        <td><button type="button" class="btn btn-success">
                            Finalizar <span class="glyphicon glyphicon-play"></span>
                        </button></td></td> 
                         <td></td> 
                        <td>
                        
                       <td></td> 
                         <td></td> 
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
</body>
</html>