<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<title>Finalizar Pedido</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand"
			href="http://localhost:8080/MyProjectWeb/Index.jsp">Hyper Books</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Sobre</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Serviços</a>
				</li>
				<%
					Cliente cli = (Cliente) session.getAttribute("usuario");
					if (cli == null) {
						StringBuilder sb = new StringBuilder();
						sb.append("<li class='nav-item'>");
						sb.append(" <a class='nav-link' href='http://localhost:8080/MyProjectWeb/Login.jsp'>");
						sb.append("Login");
						out.print(sb.toString());
					} else {
						StringBuilder sb = new StringBuilder();
						sb.append("<li class='nav-item'>");
						sb.append(" <a class='nav-link' href='DeslogarCliente?operacao=DESLOGAR'>");
						sb.append("Logout");
						out.print(sb.toString());
					}
				%>
				</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="http://localhost:8080/MyProjectWeb/SalvarCarrinho">Carrinho</a>

				</li>
			</ul>
		</div>
	</div>
	</nav>
	<div>
		<br> <br> <br>
	</div>
  <!------------------------------------------------------------- FIM DA BARRA DE NAVEGAÇÃO ----------------------------------------------------------->
	<div class='container'>
		<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
			<div class='col-md-12'>
				<div id='mainContentWrapper' style="width: 2000px;">
					<div class="col-md-8 col-md-offset-2">
						<h2 style="text-align: center; ">Avaliação do pedido e Finalizaçao da Compra</h2>
							<br>
							<br>																
										<h4>
											<a data-toggle="collapse" class="collapse show" href="#collapseOne" style="text-align: center;">Reveja Seu Pedido</a>
										</h4>
									<div id="collapseOne" class="panel-collapse collapse show" style="padding-left: 240px;">								
												<div class="col-md-9">
													<table class="table table-striped table-dark table-responsive" style="width: 100%">
														<tr>
															<td><b> Nome do Livro</b></td>
															<td><b> Valores</b></td>
														</tr>
														<tr>
															<td><li>Quantidade</li></td>
															<td><li>R$4,00</li></td>
														</tr>
														<tr>
															<td><li>Frete</li></td>
															<td><li>R$35,00</li></td>
														</tr>
														<tr>
															<td><li>Preço individual</li></td>
															<td><li>R$ 45,00</li></td>							
														<tr>
															<td><h3>Valor Total</h3></td>
															<td><h3><span style="color: green;">$147.00</span></h3></td>
														</tr>
													</table>
												</div>									
											</div></div></div></div></div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->												
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div>
		
		
		
		
		
		
		
		</div>
	</div>
	<div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
	<div>
		<br> <br> <br> <br> <br> <br> <br>
	</div>
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Hyper Books</p>
	</div>
	<!-- /.container --> </footer>

</body>
</html>