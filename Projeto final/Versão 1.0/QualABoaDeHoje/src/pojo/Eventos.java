package pojo;

public class Eventos {
	private String dataa;
	private int id;
	private String nome;
	private String cidade;
	private String atracao;
	
	public String getDataa() {
		return dataa;
	}
	public void setDataa(String dataa) {
		this.dataa = dataa;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getAtracao() {
		return atracao;
	}
	public void setAtracao(String atracao) {
		this.atracao = atracao;
	}
	public Eventos(int id, String dataa, String nome, String cidade, String atracao) {
		super();
		this.id = id;
		this.dataa = dataa;
		this.nome = nome;
		this.cidade = cidade;
		this.atracao = atracao;
	}
	@Override
	public String toString() {
		return "ID = " + id + " | Data = " + dataa + " | Nome = " + nome + " | Cidade = " + cidade + " | Atração = " + atracao;
	}
	
	
}
