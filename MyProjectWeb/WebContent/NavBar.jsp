<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Cliente cli = (Cliente) session.getAttribute("usuario");
%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"  target="_parent">
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
</body>
</html>