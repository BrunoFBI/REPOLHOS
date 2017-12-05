package MyProjectDominio;

//import java.sql.Date;
import java.util.Date;
import java.util.List;

public class Cliente extends EntidadeDominio{
	private String genero;
	private String nome;
	private Date dt_nasc;
	private Date dt_Cadastro;
	private String cpf;
	private String tipo_tel;
	private String telefone;
	private String email;
	private String senha;
	private Boolean Status;
	private List<Pedido> pedido;
	private List<Endereco> endereco;
	private List<Cartao> cartao;
	
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Date getDt_nasc() {
		return dt_nasc;
	}
	public void setDt_nasc(Date dt_nasc) {
		this.dt_nasc = dt_nasc;
	}
	public Date getDt_Cadastro() {
		return dt_Cadastro;
	}
	public void setDt_Cadastro(Date dt_Cadastro) {
		this.dt_Cadastro = dt_Cadastro;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getTipo_tel() {
		return tipo_tel;
	}
	public void setTipo_tel(String tipo_tel) {
		this.tipo_tel = tipo_tel;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Boolean getStatus() {
		return Status;
	}
	public void setStatus(Boolean status) {
		Status = status;
	}
	public List<Pedido> getPedido() {
		return pedido;
	}
	public void setPedido(List<Pedido> pedido) {
		this.pedido = pedido;
	}
	public List<Endereco> getEndereco() {
		return endereco;
	}
	public void setEndereco(List<Endereco> endereco) {
		this.endereco = endereco;
	}
	public List<Cartao> getCartao() {
		return cartao;
	}
	public void setCartao(List<Cartao> cartao) {
		this.cartao = cartao;
	}
	
	
	
}