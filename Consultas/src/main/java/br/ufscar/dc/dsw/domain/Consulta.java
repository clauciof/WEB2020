package br.ufscar.dc.dsw.domain;

public class Consulta{

	private String nomepaciente;
	private String loginpaciente;
	private String nomemedico;
	private String loginmedico;
	private String datahora;
	
	
	public Consulta( String nomep, String loginp,  String nomem, String loginm, String data) {
		
		this.nomepaciente = nomep;
		this.loginpaciente = loginp;
		this.nomemedico = nomem;
		this.loginmedico = loginm;
		this.datahora = data;
	}
	
	public Consulta( String nomep, String loginp,  String nomem, String data) {
		
		this.nomepaciente = nomep;
		this.loginpaciente = loginp;
		this.nomemedico = nomem;
		this.datahora = data;
	}
	
	

	
	public String getNomePaciente() {
		return this.nomepaciente;
	}

	public void setNomePaciente(String nome) {
		this.nomepaciente = nome;
	}

	public String getLoginPaciente() {
		return this.loginpaciente;
	}

	public void setLoginPaciente(String login) {
		this.loginpaciente = login;
	}


	public String getNomeMedico() {
		return this.nomemedico;
	}

	public void setNomeMedico(String nome) {
		this.nomemedico = nome;
	}

	public String getLoginMedico() {
		return this.loginmedico;
	}

	public void setLoginMedico(String login) {
		this.loginmedico = login;
	}
	
	public String getData() {
		return this.datahora;
	}

	public void setData(String data) {
		this.datahora = data;
	}
}