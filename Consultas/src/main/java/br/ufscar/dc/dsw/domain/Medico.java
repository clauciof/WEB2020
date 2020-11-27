package br.ufscar.dc.dsw.domain;

public class Medico {

	private String nome;
	private String login;
	private String senha;
	private String especialidade;

	
	public Medico(String nome, String login, String senha, String especialidade) {
		super();
		this.nome = nome;
		this.login = login;
		this.senha = senha;
		this.especialidade = especialidade;
	}

	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String password) {
		this.senha = password;
	}

	public String getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}
}