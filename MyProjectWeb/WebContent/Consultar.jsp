<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Consultar livro</title>
</head>
<body>

	<%
		Resultado resultado = (Resultado) session.getAttribute("resultado");
	%>

	<form action="SalvarLivro" method="post" align="center">

		
		 <label for="txtTitulo">Titulo: </label> 
		 <input type="text" id="txtTitulo" name="txtTitulo"  /> 
		 <label for="txtEditora">Editora: </label>
		 <input type="text" id="txtEditora" name="txtEditora"/>
		 <label for="txtEdicao">Edição: </label>
		 <input type="text" id="txtEdicao" name="txtEdicao"/>
		 <label for="txtSinopse">Sinopse: </label>
		 <input type="text" id="txtSinopse" name="txtSinopse"/>
		 <label for="txtAutor">Autor: </label>
		 <input type="text" id="txtSinopse" name="txtSinopse"/>
		 <label for="txtAno">Ano: </label>
		 <input type="text" id="txtAno" name="txtAno"/>
		 <label for="txtIsbn">ISBN</label>
		 <input type="text" id="txtIsbn" name="txtIsbn"/>
		 <label for="txtCategoria">Categoria</label>
		 <input type="text" id="txtCategoria" name="txtCategoria"/>
		 <label for="txtIsbn">SubCategoria</label>
		 <input type="text" id="txtSubCategoria" name="txtSubCategoria"/>
		 
		 <input type="submit" id="operacao" name="operacao" value="CONSULTAR" class='btn btn-primary' />
		  <a href="http://localhost:8080/MyProjectWeb/FormBooks.jsp"></a>
	</form>

	


	<%
	
	if(resultado !=null && resultado.getMsg() != null){
		out.print(resultado.getMsg());
	}
	
	%>
<BR>

<TABLE class="table table-inverse">
   <TR>
      <TH COLSPAN="11"><BR>
      	<H3>LIVROS</H3>
      </TH>
   </TR>
   <TR>
      <TH>ID</TH>
      <TH>Titulo</TH>
      <TH>Autor</TH>
      <TH>Categoria</TH>
      <TH>Subcategoria</TH>
      <TH>Ano</TH>
      <TH>Editora</TH>
      <TH>Edicao</TH>
      <TH>ISBN</TH>
      <TH>Paginas</TH>
      <TH>Sinopse</TH>
      <TH>Status</TH>
   </TR>
   
   <%
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		
		if(entidades != null){
			//for(Livro l : (Livro) entidades) {
			for (int i = 0; i < entidades.size(); i++) {
				Livro l = (Livro) entidades.get(i);
				sbRegistro.setLength(0);
				sbLink.setLength(0);
				
			//	<a href="nome-do-lugar-a-ser-levado">descrição</a>
				
				sbRegistro.append("<TR ALIGN='CENTER'>");
				
				
				sbLink.append("<a href=SalvarLivro?");
					sbLink.append("txtId=");
					sbLink.append(l.getId());						
					sbLink.append("&");
					sbLink.append("operacao=");
					sbLink.append("VISUALIZAR");
					if(l.getId() == null){
						pageContext.forward("SalvarLivro?operacao=CONSULTAR");
						return;
					}
				sbLink.append(">");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(l.getId() == null ? ' ' : l.getId());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getTitulo());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAutor());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getCategoria());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getSubcategoria());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAno());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEditora());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEdicao());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getISBN());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getNpaginas());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getSinopse());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getStatus());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				
				sbRegistro.append("</TR>");
				
				out.print(sbRegistro.toString());
				
			}
		}
	}
   
   %>
</TABLE>
</body>
</html>