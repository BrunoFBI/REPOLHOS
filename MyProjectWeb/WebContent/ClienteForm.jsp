<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.Cliente, java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<title>Incluir Cliente</title>
</head>
<body style="background:grey">
		<form action="SalvarCliente" method="post" class="form-horizontal" role="form">
		<%
			Cliente cliente = (Cliente)request.getAttribute("cliente");
		%>
<div class="row">
    <div class="col-md-4 col-md-offset-4" style=" margin:0 auto;">
        <fieldset>
          <!-- Text input-->
          <div class="form-group">
            <input type="hidden" id="txtId" name="txtId" class="form-control input-sm" value="${empty cliente ? '' : cliente.getId()}"/>
            <label class="col-sm-2 control-label" for="textinput">Nome</label>
            <div class="col-sm-10">
              <input type="text" id="txtNome" placeholder="Nome" name="txtNome" class="form-control input-sm" value="${empty cliente ? '' : cliente.getNome()}"/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <div class="col-sm-10">
              <input type="text" id="txtCpf"placeholder="CPF" data-mask="999.999.999-99"class="form-control input-sm" name="txtCpf" value="${empty cliente ? '' : cliente.getCpf()}"/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <div class="col-sm-10">
            <input type="text" data-mask="99/99/9999" id="txtDtNasc" placeholder="Data de Nascimento" class="form-control input-sm" name="txtDtNasc" value="${empty cliente ? '' : ConverteDatas.converteDateString(cliente.getDt_nasc())}"/>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <div class="col-sm-10">
            <select  id="txtTipoTel" placeholder="Tipo de Telefone" name="txtTipoTel"value="${empty cliente ? '' : cliente.getTipo_tel()}">
                              <option>Residencial</option>
                              <option>Celular</option>
                              <option>Comercial</option>
                            </select>
             <input type="text" id="txtTel" name="txtTelefone" data-mask="(99)99999-9999" placeholder="Telefone" class="form-control input-sm" value="${empty cliente ? '' : cliente.getTelefone()}"/>
            </div>
		</div>
		<div class="form-group">
            <div class="col-sm-10">
              <input type="text" id="txtEmail" name="txtEmail" placeholder="E-Mail" class="form-control input-sm" value="${empty cliente ? '' : cliente.getEmail()}"/>
            </div>
        </div>



          <!-- Text input-->
          <div class="form-group">
            <div class="col-sm-10">
              <input type="text" id="txtSenha" name="txtSenha" class="form-control input-sm" placeholder="Senha" value="${empty cliente ? '' : cliente.getSenha()}"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-6">
                            <select class="form-control" id="txtGenero" name="txtGenero" value="${empty cliente ? '' : cliente.getGenero()}">
                              <option>Masculino</option>
                              <option>Feminino</option>
                            </select>
                            Ativo    <input type="radio" id="rdStatus" name="rdStatus" value="true" checked>
             			    Inativo    <input type="radio" id="rdStatus" name="rdStatus" value="false" ${cliente.getStatus() == false ? 'checked' : ''}>
            </div>
          
          <%		
			if(cliente != null) {
				out.print("<input type='submit' id='operacao' name='operacao' value='ALTERAR' class='btn btn-primary'/>");	
			}else{
				out.print("<input type='submit' id='operacao' name='operacao' value='SALVAR' class='btn btn-primary'/>");
			}
				
			%>	
          </div>
		
        </fieldset>
     
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
		
</body>
</html>