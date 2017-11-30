package MyProject.impl.controle;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import MyProject.impl.dao.ClienteDAO;
import MyProject.impl.dao.CupomDAO;
import MyProject.impl.dao.EnderecoDAO;
import MyProject.impl.dao.LivroDAO;
import MyProjectCore.IDAO;
import MyProjectCore.IFachada;
import MyProjectCore.IStrategy;
import MyProjectCore.aplicacao.Resultado;
import MyProjectCore.impl.negocio.ValidaCarrinho;
import MyProjectDominio.Cliente;
import MyProjectDominio.Cupom;
import MyProjectDominio.Endereco;
import MyProjectDominio.EntidadeDominio;
import MyProjectDominio.Livro;
import MyProjectDominio.Unidade;

public class Fachada implements IFachada{

	/** 
	 * Mapa de DAOS, será indexado pelo nome da entidade 
	 * O valor é uma instância do DAO para uma dada entidade; 
	 */
	private Map<String, IDAO> daos;
	
	/**
	 * Mapa para conter as regras de negócio de todas operações por entidade;
	 * O valor é um mapa que de regras de negócio indexado pela operação
	 */
	private Map<String, Map<String, List<IStrategy>>> rns;
	
	private Resultado resultado;
	
	
	public Fachada(){
		/* Intânciando o Map de DAOS */
		daos = new HashMap<String, IDAO>();
		/* Intânciando o Map de Regras de Negócio */
		rns = new HashMap<String, Map<String, List<IStrategy>>>();
		
		/* Criando instâncias dos DAOs a serem utilizados*/
		LivroDAO LivDao = new LivroDAO();
		ClienteDAO cliDao = new ClienteDAO();
		EnderecoDAO endDao = new EnderecoDAO();
		CupomDAO cupDao = new CupomDAO();
		/* Adicionando cada dao no MAP indexando pelo nome da classe */
		
		daos.put(Livro.class.getName(), LivDao);
		daos.put(Cliente.class.getName(), cliDao);
		daos.put(Endereco.class.getName(), endDao);
		daos.put(Cupom.class.getName(),cupDao);
		//Criando instâncias de regras de negócio a serem utilizados	
		
		//vrDadosObrigatoriosLivro vrDadosObrigatorioLivro = new vrDadosObrigatoriosLivro();
		
		ValidaCarrinho QtdEstoque = new ValidaCarrinho();
		
		
		/* Criando uma lista para conter as regras de negócio de livros
		 * quando a operação for salvar
		 */
		List<IStrategy> rnsSalvarLivro = new ArrayList<IStrategy>();
		List<IStrategy> rnsSalvarCliente = new ArrayList<IStrategy>();
		List<IStrategy> rnsSalvarEndereco = new ArrayList<IStrategy>();
		List<IStrategy> rnsValidarCarrinho = new ArrayList<IStrategy>();
		//Adicionando as regras a serem utilizadas na operação salvar do fornecedor
		
			//rnsSalvarLivro.add(vrDadosObrigatorioLivro);
			rnsValidarCarrinho.add(QtdEstoque);
		
		/* Cria o mapa que poderá conter todas as listas de regras de negócio específica 
		 * por operação  do fornecedor
		 */
		Map<String, List<IStrategy>> rnsLivro = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCliente = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsEndereco = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCarrinho= new HashMap<String, List<IStrategy>>();
		/*
		 * Adiciona a lista de regras na operação salvar no mapa do fornecedor (lista criada na linha 70)
		 */
		rnsLivro.put("SALVAR", rnsSalvarLivro);
		rnsCliente.put("SALVAR",rnsSalvarCliente);
		rnsEndereco.put("SALVAR", rnsSalvarEndereco);
		rnsCarrinho.put("COMPRAR", rnsValidarCarrinho);
		
		// Adiciona o mapa(criado na linha 79) com as regras indexadas pelas operações no mapa geral indexado 
		  //pelo nome da entidade
		 
		rns.put(Livro.class.getName(), rnsLivro);
		rns.put(Unidade.class.getName(),rnsCarrinho);
	}
	
	
	
	
	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "SALVAR");
		
		
		if(msg == null){
			IDAO dao = daos.get(nmClasse);
			try {
				dao.salvar(entidade);
				List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar o registro!");
				
			}
		}else{
			resultado.setMsg(msg);
					
			
		}
		
		return resultado;
	}

	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "ALTERAR");
	
		if(msg == null){
			IDAO dao = daos.get(nmClasse);
			try {
				dao.alterar(entidade);
				List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar o registro!");
				
			}
		}else{
			resultado.setMsg(msg);
					
			
		}
		
		return resultado;

	}

	@Override
	public Resultado excluir(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "EXCLUIR");
		
		
		if(msg == null){
			IDAO dao = daos.get(nmClasse);
			try {
				dao.excluir(entidade);
				List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar o registro!");
				
			}
		}else{
			resultado.setMsg(msg);
					
			
		}
		
		return resultado;

	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "EXCLUIR");
		
		
		if(msg == null){
			IDAO dao = daos.get(nmClasse);
			try {
				
				resultado.setEntidades(dao.consultar(entidade));
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar a consulta!");
				
			}
		}else{
			resultado.setMsg(msg);
			
		}
		
		return resultado;

	}
	
	@Override
	public Resultado visualizar(EntidadeDominio entidade) {
		resultado = new Resultado();
		resultado.setEntidades(new ArrayList<EntidadeDominio>(1));
		resultado.getEntidades().add(entidade);		
		return resultado;

	}
	
	public Resultado deslogar(EntidadeDominio entidade) {
		resultado = new Resultado();	
		return resultado;

	}
	
	public Resultado comprar(EntidadeDominio entidade) {;
		
		Resultado resultado = new Resultado();
		Unidade itemCarrinho = (Unidade)entidade;
		Livro livroCarrinho = itemCarrinho.getLivro();
		System.out.println(" Resultado comprar");
		if(livroCarrinho != null)
		{
			System.out.println("TO AQUIIIIIIIII");

			LivroDAO dao = new LivroDAO();
			List<EntidadeDominio> entidadeLivro = dao.consultar(livroCarrinho);
			
			Livro l = (Livro)entidadeLivro.get(0);
			System.out.println("tamo ae"+ entidade.getClass().getName());
			itemCarrinho.setLivro(l);
			
			List<EntidadeDominio> itens = new ArrayList<EntidadeDominio>();
			itens.add(itemCarrinho);
			
			resultado.setEntidades(itens);
			
			String msg = executarRegras(itemCarrinho, "COMPRAR");
			
			resultado.setMsg(msg);
			if(resultado.getMsg() != null)
			{	System.out.println("Melancia");
				itemCarrinho.setQuantidade(l.getQuantidade());
			}			
		}
		return resultado;
	}
	
	private String executarRegras(EntidadeDominio entidade, String operacao){
		 System.out.println("Eu executo Rgras");
		String nmClasse = entidade.getClass().getName();		
		StringBuilder msg = new StringBuilder();
		
		Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClasse);
		
		
		if(regrasOperacao != null){
			List<IStrategy> regras = regrasOperacao.get(operacao);
			
			if(regras != null){
				for(IStrategy s: regras){			
					String m = s.processar(entidade);			
					
					if(m != null){
						msg.append(m);
						msg.append("\n");
					}			
				}	
			}			
			
		}
		
		if(msg.length()>0)
			return msg.toString();
		else
			return null;
	}




	@Override
	public Resultado finalizar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

/////////////Cliente/////////////////////////// Cliente ////////////////////////////Cliente/////////////////////////////Cliente/////////////////////////
	
}