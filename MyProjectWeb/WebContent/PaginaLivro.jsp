<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HyperBooks</title>
,<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>

   <%

		Resultado resultado = (Resultado) session.getAttribute("resCompra");
		if(resultado == null)
		{
			pageContext.forward("Index.jsp");
		}
		List<EntidadeDominio> entidades = resultado.getEntidades();
		Livro l = (Livro)entidades.get(0);
				Livro livro = (Livro) request.getAttribute("livro");
				request.getSession().setAttribute("livro", l);
%>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Hyper Books</a>
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
            Cliente cli = (Cliente) session.getAttribute("usuario");
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
            
            <li class="nav-item">
              <a class="nav-link" href="#">Carrinho</a>
              
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container" style="padding-top: 10%; padding-botton: 10%">
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive"  src="https://images-submarino.b2w.io/produtos/01/00/item/123806/4/123806418_1GG.jpg" />
				<br />
			</div>
			<div class="col-md-6">
				<h2>
					<%
						out.print(l.getTitulo());
					%>
				</h2>
				<br />
				<p class="text-justify"></p>
				<br>
				<h4 class="text-xs-right">
					Preço do Livro: <span style="color: #197BB5; font-size: 35px;">
						<%
							out.print("$" + l.getValor());
						%>
					</span>
				</h4>
				<br /> <br />
				<form action="SalvarCarrinho" method="post" align="center">
					<input type="submit" id="operacao" name="operacao" value="COMPRAR"class="btn btn-primary" />			
				</form>
				<%              
					StringBuilder sb = new StringBuilder();
                           sb.append("<input type='number' max='"+ l.getQuantidade() + "' min='1' class='form-control'  id='numerim' ");                                                
                            out.print(sb.toString());                   
               %>  			
			</div>
		
		</div>
			<br/> <br/>
		</div>
		</div>
			<br/> <br/>
		</div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Hyper Books</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    
</body>
</html>