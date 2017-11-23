package MyProjectDominio;

public class Unidade extends EntidadeDominio {
	private Livro livro;
	private int quantidade;

	
	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Livro getLivro() {
		return livro;
	}

	public void setLivro(Livro livro) {
		this.livro = livro;
	}
}
