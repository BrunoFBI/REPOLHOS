package MyProjectDominio;

//import java.sql.Date;
import java.util.Date;

public class Cliente extends EntidadeDominio{
	String genero;
	String nome;
	Date dt_nasc;
	Date dt_Cadastro;
	String cpf;
	String tipo_tel;
	String telefone;
	String email;
	String senha;
	String Alterador;
	public String getAlterador() {
		return Alterador;
	}
	public void setAlterador(String alterador) {
		Alterador = alterador;
	}
	boolean status;
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
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
	Endereco endereco;
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
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	
	
}
