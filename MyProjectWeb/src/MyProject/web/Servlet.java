package MyProject.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MyProject.web.command.ICommand;
import MyProject.web.command.impl.AlterarCommand;
import MyProject.web.command.impl.ComprarCommand;
import MyProject.web.command.impl.ConsultarCommand;
import MyProject.web.command.impl.ExcluirCommand;
import MyProject.web.command.impl.SalvarCommand;
import MyProject.web.command.impl.VisualizarCommand;
import MyProject.web.vh.IViewHelper;
import MyProject.web.vh.impl.AddCarrinhoViewHelper;
import MyProject.web.vh.impl.ClienteViewHelper;
import MyProject.web.vh.impl.EnderecoViewHelper;
import MyProject.web.vh.impl.LivroViewHelper;
import MyProjectCore.aplicacao.Resultado;
import MyProjectDominio.EntidadeDominio;

public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Map<String, ICommand> commands;
	private static Map<String, IViewHelper> vhs;
	
	
    /**
     * Default constructor. 
     */
    public Servlet() {
    	
    	/* Utilizando o command para chamar a fachada e indexando cada command 
    	 * pela opera��o garantimos que esta servelt atender� qualquer opera��o */
    	commands = new HashMap<String, ICommand>();
    	
    	
    	
    	commands.put("SALVAR", new SalvarCommand());
    	commands.put("EXCLUIR", new ExcluirCommand());
    	commands.put("CONSULTAR", new ConsultarCommand());
    	commands.put("VISUALIZAR", new VisualizarCommand());
    	commands.put("ALTERAR", new AlterarCommand());
    	commands.put("CONSULTARLIVRO", new ConsultarCommand());
    	commands.put("COMPRAR", new ComprarCommand());
    	commands.put("MOSTRAR", new ConsultarCommand());
    	commands.put("REMOVER", new ComprarCommand());
    	commands.put("LACRAR", new  ComprarCommand());
    	/* Utilizando o ViewHelper para tratar especifica��es de qualquer tela e indexando 
    	 * cada viewhelper pela url em que esta servlet � chamada no form
    	 * garantimos que esta servelt atender� qualquer entidade */
    	
    	vhs = new HashMap<String, IViewHelper>();
    	/*A chave do mapa � o mapeamento da servlet para cada form que 
    	 * est� configurado no web.xml e sendo utilizada no action do html
    	 */
    	vhs.put("/MyProjectWeb/SalvarLivro", new LivroViewHelper());
    	vhs.put("/MyProjectWeb/SalvarCliente", new ClienteViewHelper());
    	vhs.put("/MyProjectWeb/SalvarEndereco", new EnderecoViewHelper());
    	vhs.put("/MyProjectWeb/SalvarCarrinho", new AddCarrinhoViewHelper());
    	vhs.put("/MyProjectWeb/PaginaLivro", new LivroViewHelper());
    	vhs.put("/MyProjectWeb/SalvarCarrinho", new AddCarrinhoViewHelper());
    }
    
    
    /** 
     * TODO Descri��o do M�todo
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
    		IOException {
    	doProcessRequest(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcessRequest(request, response);
	}
	
	
	protected void doProcessRequest(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
	
		//Obt�m a uri que invocou esta servlet (O que foi definido no methdo do form html)
		String uri = request.getRequestURI();
		
		//Obt�m a opera��o executada
		String operacao = request.getParameter("operacao");
		
		//Obt�m um viewhelper indexado pela uri que invocou esta servlet
		IViewHelper vh = vhs.get(uri);
		
		//O viewhelper retorna a entidade especifica para a tela que chamou esta servlet
		EntidadeDominio entidade =  vh.getEntidade(request);

		//Obt�m o command para executar a respectiva opera��o
		ICommand command = commands.get(operacao);
		
		
		/*Executa o command que chamar� a fachada para executar a opera��o requisitada
		 * o retorno � uma inst�ncia da classe resultado que pode conter mensagens derro 
		 * ou entidades de retorno
		 */
		Resultado resultado = command.execute(entidade);
		
		/*
		 * Executa o m�todo setView do view helper espec�fico para definir como dever� ser apresentado 
		 * o resultado para o usu�rio
		 */
		vh.setView(resultado, request, response);
	
	}
 
}
