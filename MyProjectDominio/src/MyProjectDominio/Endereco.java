package MyProjectDominio;

public class Endereco extends EntidadeDominio {
	int cli_id;
	String tipo_res;
	String tipo_log;
	String logradouro;
	String numero;
	String bairro;
	String cidade;
	String cep;
	String estado;
	String pais;
	String obs;
	String responsavel;
	Boolean pref;
	public Boolean getPref() {
		return pref;
	}
	public void setPref(Boolean pref) {
		this.pref = pref;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getTipo_res() {
		return tipo_res;
	}
	public void setTipo_res(String tipo_res) {
		this.tipo_res = tipo_res;
	}
	public String getTipo_log() {
		return tipo_log;
	}
	public void setTipo_log(String tipo_log) {
		this.tipo_log = tipo_log;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public int getCli_id() {
		return cli_id;
	}
	public void setCli_id(int cli_id) {
		this.cli_id = cli_id;
	}
	public String getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}
	
}
