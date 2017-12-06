<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de endere�o</title>
</head>
<body>
	<form action="SalvarEndereco" method="post" id="frmSalvarEndereco" target="_parent">
			<div class="row">
        <div class="col-md-6 mb-3">
            <label>Logradouro</label>
            <input type="text" class="form-control" id="txtLogradouro" name="txtLogradouro"  required>
        </div>

        <div class="col-md-2 mb-2">
            <label>Tipo Logradouro</label>
            <select class="custom-select" style="width:189px;">                  
                <option>Selecione</option>
                <option>Casa</option>
                <option>Apartamento</option>
                <option>Sitio</option>
            </select>
        </div>
        <div class="col-md-2 mb-2">
            <label>Tipo Residencia</label>
            <input type="text"class="form-control" id="txtTipoResidencia" name="txtTipoResidencia" required>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label>Bairro</label>
            <input type="text"class="form-control" id="txtBairro" name="txtBairro" required>   
        </div>       
        <div class="col-md-2 mb-2">
            <label>Estado</label>
            <select class="custom-select"id="txtEstado" name="txtEstado">
                    <option value="AC">Acre</option>
                    <option value="AL">Alagoas</option>
                    <option value="AP">Amap�</option>
                    <option value="AM">Amazonas</option>
                    <option value="BA">Bahia</option>
                    <option value="CE">Cear�</option>
                    <option value="DF">Distrito Federal</option>
                    <option value="ES">Esp�rito Santo</option>
                    <option value="GO">Goi�s</option>
                    <option value="MA">Maranh�o</option>
                    <option value="MT">Mato Grosso</option>
                    <option value="MS">Mato Grosso do Sul</option>
                    <option value="MG">Minas Gerais</option>
                    <option value="PA">Par�</option>
                    <option value="PB">Para�ba</option>
                    <option value="PR">Paran�</option>
                    <option value="PE">Pernambuco</option>
                    <option value="PI">Piau�</option>
                    <option value="RJ">Rio de Janeiro</option>
                    <option value="RN">Rio Grande do Norte</option>
                    <option value="RS">Rio Grande do Sul</option>
                    <option value="RO">Rond�nia</option>
                    <option value="RR">Roraima</option>
                    <option value="SC">Santa Catarina</option>
                    <option value="SP">S�o Paulo</option>
                    <option value="SE">Sergipe</option>
                    <option value="TO">Tocantins</option>
                </select>
        </div>

        <div class="col-md-2 mb-3">
                <label>CEP</label>
                <input type="text"class="form-control" id="txtCep" name="txtCep" required>
            </div>
           
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label>Cidade</label>
            <input type="text"class="form-control" id="txtCidade" name="txtCidade" required>
        </div>
        <div class="col-md-2 mb-3">
            <label>Pa�s</label>
            <input  type="text" class="form-control"  id="txtPais" name="txtPais" style="width:190px" required>
        </div>
        <div class="col-md-2 mb-2">
            <label>N�mero</label>
            <input type="text"class="form-control" id="txtNumero" name="txtNumero" required>
        </div>
    </div>
    <div class="row" style="margin-left: 345px;">
        <div class="col-md-6 mb-3">
            <label style=" margin-left: 130px;" >Observa��o</label>
            <textarea  type="text" class="form-control"  id="txtObservacao" name="txtObservacao" ></textarea>
       </div>
		<input type="submit" class="btn btn-primary" style="height: 55px; margin-top: 34px "id="operacao" name="operacao" value="SALVAR" class="btn btn-default" />
    </div>	
    	<input type="hidden" name="local" id="local" value="fakEnd"/> 		
		</form>
</body>
</html>