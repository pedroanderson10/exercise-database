
package pojo;

public class Atracoes {
	String nome;
	String descricao;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public Atracoes(String nome, String descricao) {
		super();
		this.nome = nome;
		this.descricao = descricao;
	}
	
	@Override
	public String toString() {
		return "Atracoes [nome=" + nome + ", descricao=" + descricao + "]";
	}
	
}
