<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Cartão</title>
</head>
<body>
<body>
	<form action="SalvarCartao" method="post" id="frmSalvarEndereco">
			<table class="table table-bordered">
				<tr><TH COLSPAN="2">Cadastro de Cartão</TH></tr>
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type="text" class="form-control" id="txtId" name="txtId" value="${empty cliente ? '' : cliente.getId()}"/>
					</td>
				</tr>
				<tr>
					<td>
						Dados do Cartão
					</td>
					<td>
						<input type="text"  placeholder="Titular" class="form-control" id="txtTitular" name="txtTitular" value="${empty cliente ? '' : cliente.getId()}"/>
						<input type="text"  placeholder="Codigo" class="form-control" id="txtCodigo" name="txtCodigo" value="${empty cliente ? '' : cliente.getId()}"/>
						<input type="text"  placeholder="Número" class="form-control" id="txtNumero" name="txtNumero" value="${empty cliente ? '' : cliente.getId()}"/>
						<select  id="txtBandeira" placeholder="Bandeira" name="txtBandeira"value="${empty cliente ? '' : cliente.getTipo_tel()}">
                              <option>Visa</option>
                              <option>Master-Card</option>
                              <option>XereCard</option>
                        </select>                   			
					</td>
					
					<td>
						<div>
							Sim    <input type="radio" id="rdPref" name="rdPref" value="true" checked>
	             			Não   <input type="radio" id="rdPref" name="rdPref" value="false" ${cliente.getPref() == false ? 'checked' : ''}>
						
						</div>
						<input type="text"  placeholder="Validade" class="form-control" id="txtValidade" name="txtValidade" value="${empty cliente ? '' : cliente.getId()}"/>
					</td>
					
				</tr>	
			</table>
			<input type="submit" class="btn btn-primary" id="operacao" name="operacao" value="${empty cliente ? 'SALVAR' : 'ALTERAR'}" class="btn btn-default" />
		</form>
</body>
</body>
</html>