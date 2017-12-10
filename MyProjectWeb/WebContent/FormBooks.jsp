<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.Livro, java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Incluir</title>

</head>
<body style="background:grey">
	<div class="container">
		<form action="SalvarLivro" method="post">
		<%
			Livro livro = (Livro)request.getAttribute("livro");
		%>
				<table>
					<tr>
							
							<input type="hidden" id="txtId" name="txtId" value="${empty livro ? '' : livro.getId()}"/>
							<br> 
							<td>
				
								<input type="text" placeholder="Autor" id="txtAutor" name="txtAutor" value="${empty livro ? '' : livro.getAutor()}"/>
								<br>
							</td>		
							<td>
								
								<input type="text" id="txtCategoria" placeholder="Categoria" name="txtCategoria" value="${empty livro ? '' : livro.getCategoria()}"/>
								<br> 
							</td>		
							<td>
						
								<input type="text" id="txtSubCategoria" placeholder="SubCategoria" name="txtSubCategoria"value="${empty livro ? '' : livro.getSubcategoria()}"/>
								<br>
							</td> 
					</tr>
			</table>
			<table>
					<tr>
						<td>
						
							<input type="text" id="txtAno"placeholder="Ano"  name="txtAno" value="${empty livro ? '' : livro.getAno()}"/>
							<br> 
						</td>		
						<td>
							
							<input type="text" id="txtTitulo" placeholder="Titulo" name="txtTitulo"value="${empty livro ? '' : livro.getTitulo()}"/>
							<br>
						</td>
						<td>
							
							<input type="text" id="txtEditora" placeholder="Editora" name="txtEditora"value="${empty livro ? '' : livro.getAutor()}"/>
							<br> 
						</td>
					</tr>
			</table>		
			<table>	
					<tr>
						<td>
							
							<input type="text" id="txtEdicao" name="txtEdicao" placeholder="Edição" value="${empty livro ? '' : livro.getEdicao()}"/>
							<br>
						</td>
						<td>
							
							<input type="text" id="txtISBN" name="txtISBN" placeholder="ISBN"value="${empty livro ? '' : livro.getISBN()}"/>
							<br>  
						</td>
						<td>
							
							<input type="text" id="txtPaginas" placeholder="Num Paginas" name="txtPaginas"value="${empty livro ? '' : livro.getNpaginas()}"/>
							<br> 
						</td>
						<td>
							<input type="text" id="txtSinopse" placeholder="Sinopse" name="txtSinopse"value="${empty livro ? '' : livro.getStatus()}"/>
							
							Ativo    <input type="radio" id="rdStatus" name="rdStatus" value="true" checked>
             			    Inativo  <input type="radio" id="rdStatus" name="rdStatus" value="false" ${livro.getStatus() == false ? 'checked' : ''}>
							<br>
						</td>
						
				 </tr>
			</table> 
			<%		
			if(livro != null) {
				out.print("<input type='submit' id='operacao' name='operacao' value='ALTERAR' class='btn btn-primary'/>");	
			}else{
				out.print("<input type='submit' id='operacao' name='operacao' value='SALVAR' class='btn btn-primary'/>");
			}	
			%>			
		
		</form>
	</div>
</body>
</html>