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
        <a class="navbar-brand" href="#">Start Bootstrap</a>
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

    <!-- Page Content -->
    <div   class="container" >


        <div class="col-lg-9">

          <div class="card mt-4">
            <img class="card-img-top" src="https://www.mykemptvillenow.com/wp-content/uploads/2015/06/Books-900x641.jpg " alt="">
            <div class="card-body">
              <% 
              	out.print(l.getTitulo());
              %>
					<h4>$99.99</h4>
              <p class="card-text">Livro muito bacana com um monte de palavra pra voce ler com a galera e se divertir muito com essa turminha da pesada</p>
        	  
        	  <form action="SalvarCarrinho" method="post" align="center">
        			<input  type="submit" id="operacao" name="operacao" value="COMPRAR" class="btn btn-primary"/>
			  </form>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

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