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
		<br>
		<br>
		<br>
	</div>
	<div class='container'>
		<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
			<div class='col-md-12'>
				<div id='mainContentWrapper'>
					<div class="col-md-8 col-md-offset-2">
						<h2 style="text-align: center;">Avaliação do pedido e
							Finalizaçao da Compra</h2>
						<div class="shopping_cart">
							<form class="form-horizontal" role="form" action="" method="post"
								id="payment-form">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" class="collapse show"
													data-parent="#accordion" href="#collapseOne">Reveja Seu
													Pedido</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in">
											<div class="panel-body">
												<div class="items">
													<div class="col-md-9">
														<table class="table table-striped">
															<tr>
																<td colspan="2"><b> Nome do Livro</b></td>
															</tr>
															<tr>
																<td>
																	<ul>
																		<li>Quantidade</li>
																		<li>data</li>
																		<li>Quantidade</li>

																	</ul>
																</td>
																<td><b>$147.00</b></td>
															</tr>
														</table>
													</div>
													<div class="col-md-3">
														<div style="text-align: center;">
															<h3>Valor Total</h3>
															<h3>
																<span style="color: green;">$147.00</span>
															</h3>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<div style="text-align: center;">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseThree" class=" btn   btn-success"
													id="payInfo" style="width: 100%; display: none;"
													onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter
													Payment Information »</a>
											</div>
										</h4>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseThree"> <b>Informações de Pagamento</b>
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<span class='payment-errors'></span>
											<fieldset>
												<legend>What method would you like to pay with
													today?</legend>
												<div class="form-group">
													<label class="col-sm-3 control-label"
														for="card-holder-name">Name on Card</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" stripe-data="name"
															id="name-on-card" placeholder="Card Holder's Name">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="card-number">Card
														Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control"
															stripe-data="number" id="card-number"
															placeholder="Debit/Credit Card Number"> <br />
														<div>
															<img class="pull-right"
																src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png"
																style="max-width: 250px; padding-bottom: 20px;">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="expiry-month">Expiration
															Date</label>
														<div class="col-sm-9">
															<div class="row">
																<div class="col-xs-3">
																	<select class="form-control col-sm-2"
																		data-stripe="exp-month" id="card-exp-month"
																		style="margin-left: 5px;">
																		<option>Month</option>
																		<option value="01">Jan (01)</option>
																		<option value="02">Feb (02)</option>
																		<option value="03">Mar (03)</option>
																		<option value="04">Apr (04)</option>
																		<option value="05">May (05)</option>
																		<option value="06">June (06)</option>
																		<option value="07">July (07)</option>
																		<option value="08">Aug (08)</option>
																		<option value="09">Sep (09)</option>
																		<option value="10">Oct (10)</option>
																		<option value="11">Nov (11)</option>
																		<option value="12">Dec (12)</option>
																	</select>
																</div>
																<div class="col-xs-3">
																	<select class="form-control" data-stripe="exp-year"
																		id="card-exp-year">
																		<option value="2016">2016</option>
																		<option value="2017">2017</option>
																		<option value="2018">2018</option>
																		<option value="2019">2019</option>
																		<option value="2020">2020</option>
																		<option value="2021">2021</option>
																		<option value="2022">2022</option>
																		<option value="2023">2023</option>
																		<option value="2024">2024</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="cvv">Card
															CVC</label>
														<div class="col-sm-3">
															<input type="text" class="form-control" stripe-data="cvc"
																id="card-cvc" placeholder="Security Code">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-3 col-sm-9"></div>
													</div>
											</fieldset>
											<button type="submit" class="btn btn-success btn-lg"
												style="width: 100%;">Pay Now</button>
											<br />
											<div style="text-align: left;">
												<br /> By submiting this order you are agreeing to our <a
													href="/legal/billing/">universal billing agreement</a>, and
												<a href="/legal/terms/">terms of service</a>. If you have
												any questions about our products or services please contact
												us before placing this order.
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Hyper Books</p>
	</div>
	<!-- /.container --> </footer>

</body>
</html>