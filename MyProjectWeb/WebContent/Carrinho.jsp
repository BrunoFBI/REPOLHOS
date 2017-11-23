<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.Livro, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	List<Livro> livros = (List<Livro>)request.getSession().getAttribute("livros");	
	Map<Integer, Integer> map = (Map<Integer, Integer>) request.getSession().getAttribute("mapCar");
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
            <li class="nav-item">
              <a class="nav-link" href="#">login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Carrinho</a>
              
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <br><br><br>
	<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Preço</th>
                        <th style="padding-left:84px;">Total</th>
                    </tr>
                </thead>
               <%
						if(livros!= null)
						{
							StringBuilder sb = new StringBuilder();
							
							for(int i = 0; i < map.size(); i++)	
							{
								     Livro l = livros.get(i); 
								     sb.setLength(0);
									 sb.append("<tbody>");
                                     sb.append("<tr>");
                                     sb.append("<td class='col-sm-8 col-md-6'>");
                                     sb.append("<div class='media'>");                                   
                                     sb.append("<div class='media-body'>");    
                                     sb.append("<h4 class='media-heading'><a href='#''>");
                                     sb.append(l.getTitulo());
                                     System.out.print(l.getId());
                                     sb.append("</a></h4>");
                                     sb.append("</div>");
                                     sb.append("</div></td>");
                                     sb.append("<td data-th='Quantity'>");
                                     sb.append("<input type='number' class='form-control' id='numerim' onchange='Redirecionar(this.value,"+ l.getId()+")'>");
                                     sb.append("</td>");
                                     sb.append("</td>");
                                     sb.append("<td class='col-sm-1 col-md-1 text-center'><strong>"); 
                                     sb.append(l.getValor());
                                     System.out.println(l.getValor());
                                     sb.append("</strong></td>");
                                     sb.append("<td class='col-sm-1 col-md-1 text-center'><strong>");
                                     sb.append("50,00");
                                     sb.append("</strong></td>");
                                     sb.append("<td class='col-sm-1 col-md-1'>");
                                     sb.append("<a href='SalvarCarrinho?operacao=REMOVER&id=" + l.getId() +"'>");
                                     sb.append("<button class='btn btn-danger'>REMOVER</button>");
                                     sb.append("</a>");                                    
                                     sb.append("</td>"); 
                                     sb.append("</tr>");       
                                     sb.append("</tbody>");
                                     out.print(sb.toString());
                             }	
 	
									request.getSession().setAttribute("mapCar", map);	
						} 
				%>
                <tfoot>
                    <tr>
                        <td><h5>Total<br>Frete</h5><h3>Total</h3></td>
                        <td class="text-right"><h5><strong>$24.59<br>$6.94</strong></h5><h3>$31.53</h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="http://localhost:8080/MyProjectWeb/Index.jsp" type="button" class="btn btn-default">
                         Continuar Comprando
                        </a>
                        </td>
                        <td>
                        <button type="button" class="btn btn-success">
                            Finalizar <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
</body>
</html>