<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Your Book</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
  	
  </head>

  <body>
  		<%
  		Resultado resultado = (Resultado) session.getAttribute("resConsultaLivro");
    		
  		if(resultado == null)
  		{
  			pageContext.forward("SalvarLivro?operacao=CONSULTARLIVRO");
  			return;
  		}
  		
  		%>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">HyperBook</a>
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
              <a class="nav-link" href="#">Carrinho</a>
              <i class="material-icons"></i>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Login</a>
            </li>      
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Hyper Books</h1>
          <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
              </div>
            </div>
          </div>

          <div class="row">
          <br><br><br>
 <% 
   
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		if(entidades == null ){
			System.out.print("bbbbbbbbbbbbb");
		}
		
		if(entidades != null){
			for (int i = 0; i < entidades.size(); i++) {
				System.out.print("ccccccccccccccccc");
				Livro l = (Livro) entidades.get(i);
				sbRegistro.setLength(0);
				sbLink.setLength(0);
				
			//	<a href="nome-do-lugar-a-ser-levado">descrição</a>
				
				
				sbLink.append("<a href=PaginaLivro?");
					sbLink.append("txtId=");
					sbLink.append(l.getId());						
					sbLink.append("&");
					sbLink.append("operacao=");
					sbLink.append("MOSTRAR");
				sbLink.append(">");
				
				if(l.getStatus() == true){
					sbRegistro.append("<div class='col-lg-4 col-md-6 mb-4'>");
					sbRegistro.append("<div style='text-align:center'>");	
					sbRegistro.append("<a href='#'><img class='card-img-top' src='https://mthumbs.buscape.com.br/livros/o-senhor-dos-aneis-trilogia-j-r-r-tolkien-8533619626_300x300-PU6e780f2a_1.jpg' alt=''></a>");
					sbRegistro.append("<div class='card-body'>");
					sbRegistro.append("<h4 class='card-title'>");
					sbRegistro.append(sbLink.toString());				
					sbRegistro.append(l.getTitulo());
					sbRegistro.append("</a>");	
					sbRegistro.append("</h4>");
					sbRegistro.append("<h5>$24.99</h5>");
					sbRegistro.append("<p class='card-text'></p>");
					sbRegistro.append("</div>");
					sbRegistro.append("</div>");
					sbRegistro.append("</div>");
				 }
				
				
			
				
				out.print(sbRegistro.toString());
				
			}
		}
		
	}
   
   %>


          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; The Best IT Books</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>