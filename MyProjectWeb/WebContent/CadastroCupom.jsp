<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Cart�o</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Incluir</title>
</head>
<body>
<body>
	<form action="SalvarCupom" method="post" id="frmSalvarEndereco">
			<table class="table table-bordered">
				<tr><TH COLSPAN="2">Cadastro de Cupom</TH></tr>
				<tr>
					<td>
						Dados do Cupom
					</td>
					<td>
						<input type="text"  placeholder="Data de validade" data-mask="99/99/9999"  class="form-control" id="dtValidade" name="dtValidade">
						<input type="text"  placeholder="Valor do Desconto" class="form-control" id="txtDesconto" name="txtDesconto">
						<input type="text"  placeholder="Codigo" class="form-control" id="txtSerial" name="txtSerial">
						<input type="hidden"  placeholder="N�mero" class="form-control" id="txtId" name="txtId">
						 Promocional  <input type="radio" id="tpCupom" name="tpCupom" value="true" checked>
             			 Troca    <input type="radio" id="tpCupom" name="tpCupom" value="false">
					</td>
					
				</tr>	
			</table>
			<input type="submit" class="btn btn-primary" id="operacao" name="operacao" value="${empty cliente ? 'SALVAR' : 'ALTERAR'}" class="btn btn-default" />
		</form>
</body>
</body>
</html>