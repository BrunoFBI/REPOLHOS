<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="MyProjectCore.aplicacao.Resultado, MyProjectDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function PegaCartao(idCar){
		document.getElementById("idCart").value = idCar;
	}


</script>
<title>Cadastro de Cartão</title>
</head>
<style>
	html,body,.wrapper{
    background: #f7f7f7;
}
.steps {
    margin-top: -41px;
    display: inline-block;
    float: right;
    font-size: 16px
}
.step {
    float: left;
    background: white;
    padding: 7px 13px;
    border-radius: 1px;
    text-align: center;
    width: 100px;
    position: relative
}
.step_line {
    margin: 0;
    width: 0;
    height: 0;
    border-left: 16px solid #fff;
    border-top: 16px solid transparent;
    border-bottom: 16px solid transparent;
    z-index: 1008;
    position: absolute;
    left: 99px;
    top: 1px
}
.step_line.backline {
    border-left: 20px solid #f7f7f7;
    border-top: 20px solid transparent;
    border-bottom: 20px solid transparent;
    z-index: 1006;
    position: absolute;
    left: 99px;
    top: -3px
}
.step_complete {
    background: #357ebd
}
.step_complete a.check-bc, .step_complete a.check-bc:hover,.afix-1,.afix-1:hover{
    color: #eee;
}
.step_line.step_complete {
    background: 0;
    border-left: 16px solid #357ebd
}
.step_thankyou {
    float: left;
    background: white;
    padding: 7px 13px;
    border-radius: 1px;
    text-align: center;
    width: 100px;
}
.step.check_step {
    margin-left: 5px;
}
.ch_pp {
    text-decoration: underline;
}
.ch_pp.sip {
    margin-left: 10px;
}
.check-bc,
.check-bc:hover {
    color: #222;
}
.SuccessField {
    border-color: #458845 !important;
    -webkit-box-shadow: 0 0 7px #9acc9a !important;
    -moz-box-shadow: 0 0 7px #9acc9a !important;
    box-shadow: 0 0 7px #9acc9a !important;
    background: #f9f9f9 url(../images/valid.png) no-repeat 98% center !important
}

.btn-xs{
    line-height: 28px;
}

/*login form*/
.login-container{
    margin-top:30px ;
}
.login-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.login-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.login-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.login-container-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #357ebd;/*#4d90fe;*/
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.login-container-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.login-help{
  font-size: 12px;
}

.asterix{
    background:#f9f9f9 url(../images/red_asterisk.png) no-repeat 98% center !important;
}

/* images*/
ol, ul {
  list-style: none;
}
.hand {
  cursor: pointer;
  cursor: pointer;
}
.cards{
    padding-left:0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .mastercard {
  background-position: -51px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .amex {
  background-position: -102px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards li:last-child {
  margin-right: 0;
}
/* images end */



/*
 * BOOTSTRAP
 */
.container{
    border: none;
}
.panel-footer{
    background:#fff;
}
.btn{
    border-radius: 1px;
}
.btn-sm, .btn-group-sm > .btn{
    border-radius: 1px;
}
.input-sm, .form-horizontal .form-group-sm .form-control{
    border-radius: 1px;
}

.panel-info {
    border-color: #999;
}

.panel-heading {
    border-top-left-radius: 1px;
    border-top-right-radius: 1px;
}
.panel {
    border-radius: 1px;
}
.panel-info > .panel-heading {
    color: #eee;
    border-color: #999;
}
.panel-info > .panel-heading {
    background-image: linear-gradient(to bottom, #555 0px, #888 100%);
}

hr {
    border-color: #999 -moz-use-text-color -moz-use-text-color;
}

.panel-footer {
    border-bottom-left-radius: 1px;
    border-bottom-right-radius: 1px;
    border-top: 1px solid #999;
}

.btn-link {
    color: #888;
}

hr{
    margin-bottom: 10px;
    margin-top: 10px;
}

/** MEDIA QUERIES **/
@media only screen and (max-width: 989px){
    .span1{
        margin-bottom: 15px;
        clear:both;
    }
}

@media only screen and (max-width: 764px){
    .inverse-1{
        float:right;
    }
}

@media only screen and (max-width: 586px){
    .cart-titles{
        display:none;
    }
    .panel {
        margin-bottom: 1px;
    }
}

.form-control {
    border-radius: 1px;
}

@media only screen and (max-width: 486px){
    .col-xss-12{
        width:100%;
    }
    .cart-img-show{
        display: none;
    }
    .btn-submit-fix{
        width:100%;
    }
    
}
/
@media only screen and (max-width: 777px){
    .container{
        overflow-x: hidden;
    }
}
</style>
<body>
<%
	Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
	String txtId = (String) request.getSession().getAttribute("userid");
	int id = Integer.parseInt(txtId);
	Cliente cli = (Cliente) session.getAttribute("usuario");
	
%>
<div class="embed-responsive embed-responsive-16by9">
  				<iframe class="embed-responsive-item" src="http://localhost:8080/MyProjectWeb/NavBar.jsp"></iframe>  				
</div>
<div class="container wrapper" style="margin-top: -700px;">
            <div class="row cart-head">
                <div class="container">
                <div class="row">
                    <p></p>
                </div>
                <div class="row">
                    <div style="display: table; margin: auto;">
                        <span class="step step_complete"> <a href="#" class="check-bc">Carrinho</a> <span class="step_line step_complete"> </span> <span class="step_line backline"> </span> </span>
                        <span class="step step_complete"> <a href="#" class="check-bc">Checkout</a> <span class="step_line "> </span> <span class="step_line step_complete"> </span> </span>
                    </div>
                </div>
                <div class="row">
                    <p></p>
                </div>
                </div>
            </div>    
            <div class="row cart-body">
                <form class="form-horizontal" method="post" action="">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    <!--REVIEW ORDER-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Review Order <div class="pull-right"><small><a class="afix-1" href="#">Edit Cart</a></small></div>
                        </div>
                       <% 
                       		Pedido p = map.get(id);	
                       StringBuilder bui = new StringBuilder();
                      
                       	for(int i = 0; i <  p.getUnidade().size() ; i++){
                       bui.append("<div class='panel-body'>"); 
                       bui.append("<div class='form-group'>"); 
                       bui.append("<div class='col-sm-3 col-xs-3'>");  
                       bui.append("<img class='img-responsive' src='//c1.staticflickr.com/1/466/19681864394_c332ae87df_t.jpg'a />");  
                       bui.append("</div>");
                       bui.append("<div class='col-sm-6 col-xs-6'>");  
                       bui.append("<div class='col-xs-12'>Harry Potter</div>");   
                       bui.append("<div class='col-xs-12'><small>");
                       bui.append(p.getQtdItens());
                       bui.append( "<span>1</span></small></div>");   
                       bui.append("</div>"); 
                       bui.append("<div class='col-sm-3 col-xs-3 text-right'>"); 
                       bui.append("<h6><span>$</span>");
                       bui.append(p.getPrecoTotal() / p.getQtdItens());
                       bui.append("</h6>"); 
                       bui.append("</div>"); 
                       bui.append("</div>"); 
                       out.print(bui.toString());
                       	}
                         %> 
                            
                         <% 
                            StringBuilder bu = new StringBuilder();
                     	Pedido pi= map.get(id);	    
                     bu.append("<div class='form-group'><hr /></div>  ");                        
                     bu.append("<div class='form-group'><hr /></div>");       
                     bu.append("<div class='form-group'>");        
                     bu.append("<div class='col-xs-12'>");            
                     bu.append("<strong>Subtotal</strong>");                
                     bu.append("<div class='pull-right'><span>$</span><span>"); 
                     bu.append(pi.getPrecoTotal());
                     bu.append("</span></div>");
                     bu.append("</div>");           
                     bu.append("<div class='col-xs-12'>");           
                     bu.append("<small>frete</small>");               
                     bu.append(" <div class='pull-right'><span>");
                     bu.append(pi.getPrecoFrete());		 
                     bu.append("</span></div>");
                     bu.append("</div>");           
                     bu.append("</div>");       
                     bu.append("<div class='form-group'><hr /></div>");       
                     bu.append(" <div class='form-group'>");       
                     bu.append("<div class='col-xs-12'>");            
                     bu.append("<strong>Valor final</strong>");               
                     bu.append("<div class='pull-right'><span>");
                     bu.append(pi.getPrecoFinal());   
                     bu.append("</span><span></span></div>");   
                     bu.append(" </div>");           
                     bu.append("</div>");
                     bu.append("<form method='post' action='fazCheckout'>");
                     bu.append("<input type='submit' id='operacao'class='btn btn-primary btn-sm' name='operacao' value='CHECKOUT'/>");
                     bu.append("<input type='hidden' name ='idCart' id='idCart'/>");
                     bu.append("</div>");    
                     bu.append("</div>"); 
                     bu.append("</form>");
                     out.print(bu.toString());
                    %>   
                    <!--REVIEW ORDER END-->
                </div>
                <div class="row cart-body">
                <form class="form-horizontal" method="post" action="SalvarCartao">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    <!--REVIEW ORDER-->
                    
                    <!--REVIEW ORDER END-->
                </div>
               
               <%           		
               if(cli.getCartao().size() == 0){              	
               		StringBuilder sb = new StringBuilder();
               		sb.append("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6'>");
               		sb.append("<div class='embed-responsive embed-responsive-16by9' style='height:500px;'>");
               		sb.append("<iframe class='embed-responsive-item'  src='http://localhost:8080/MyProjectWeb/Cartao.jsp' allowfullscreen></iframe>");
               		sb.append("<div>");
               		out.print(sb.toString());
               }
              %>
            			
            	<%		
            			
            	if(cli.getCartao().size() > 0){       
            		StringBuilder st = new StringBuilder();
            		st.append("<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6'>");
            		st.append("<table class='table table-striped table-dark table-responsive' style='width: 450px'>");	
            		st.append("<tr>");	
            		st.append("<td><b> Codigo</b></td>");
            		st.append("<td><b> Bandeira</b></td>");
            		st.append("<td><b> Preferencial</b></td>");
            		st.append("</tr>");
            		
            		if(cli != null)
    	 			{
    	 				
    	 				
    	 				for(int k = 0; k < cli.getCartao().size(); k++){
    	 					st.append("<tr>");
    	 					st.append("<td><li>");
    	 					st.append(cli.getCartao().get(k).getCodigo());
    	 					st.append("</li></td>");			
    	 					st.append("<td>");
    	 					st.append(cli.getCartao().get(k).getBandeira());
    	 					st.append("</td>");
    	 					st.append("<td>");
    	 					st.append("<button type='button' class='btn btn-primary btn-sm'  id='EndID' value='"+k+"' onclick='PegaCartao(this.value)'>Quero este</input>");
    	 					st.append("</td>");	
    	 					st.append("</tr>");				
    	 			}								
    	 				st.append("</table>");	
    	 				st.append("</div>");
    	 				out.print(st.toString());
    	 				
    	 			}								
            	}
            	
            	 	%>
            	      </div>
                    <%   	
	                if(cli.getCartao().size() == 0){              	
	                     StringBuilder st = new StringBuilder();               	
	                     st.append("<button type='button' class='btn btn-primary btn-block'>Cadastre um cartão para finalizar</button>");
	                     out.print(st.toString());
	                	}
	                	else{
	                		StringBuilder st = new StringBuilder();               	
	                        st.append("<button type='button' class='btn btn-primary btn-block'>Selecione o Cartão de pagamento</button>");
	                        out.print(st.toString());
	                	}
	                %>
                </div>
                
                </form>
                    <!--CREDIT CART PAYMENT END-->
                </div>
                
                </form>
            </div>
            <div class="row cart-footer">
        
            </div>
    </div>
    </body>
</html>