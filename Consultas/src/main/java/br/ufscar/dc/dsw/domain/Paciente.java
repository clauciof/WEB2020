package br.ufscar.dc.dsw.domain;

public class Paciente {

	private String nome;
	private String login;
	private String senha;
	private String cpf;
	private String telefone;
	private String sexo;
	private String nascimento;
	
	
	public Paciente(String login) {
		
		this.login = login;
		
		
	}
	
	public Paciente(String nome, String login, String senha, String telefone) {
		this.nome = nome;
		this.login = login;
		this.senha = senha;
		this.telefone = telefone;
		
	}

	
	public Paciente(String nome, String login, String senha, String cpf, String telefone, String sexo, String nascimento) {
		super();
		this.nome = nome;
		this.login = login;
		this.senha = senha;
		this.cpf = cpf;
		this.telefone = telefone;
		this.sexo = sexo;
		this.nascimento = nascimento;
		
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

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getNascimento() {
		return nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

}