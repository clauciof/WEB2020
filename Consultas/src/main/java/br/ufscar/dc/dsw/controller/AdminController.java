package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.ufscar.dc.dsw.dao.MedicoDAO;
import br.ufscar.dc.dsw.dao.PacienteDAO;

import br.ufscar.dc.dsw.domain.Medico;
import br.ufscar.dc.dsw.domain.Paciente;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/admin/*")
public class AdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
    	Erro erros = new Erro();
    	
    	if (usuario == null) {
    		response.sendRedirect(request.getContextPath());
    	} else if (usuario.getPapel().equals("ADMIN")) {
    		
    		String action = request.getPathInfo();
    	    	if (action == null) {
    	            action = "";
    	        }
    	    	
    	    	try {
    	            switch (action) {
    	                case "/cadastromedicos":
    	                    apresentaFormCadastroMedicos(request, response);
    	                    break;
    	                case "/cadastropacientes":
    	                    apresentaFormCadastroPacientes(request, response);
    	                    break;
    	                case "/inseremedico":
    	                    insereMedico(request, response);
    	                    break;
    	                case "/inserepaciente":
    	                    inserePaciente(request, response);
    	                    break;
    	                case "/remocaomedico":
    	                    removeMedico(request, response);
    	                    break;
    	                case "/remocaopaciente":
    	                    removePaciente(request, response);
    	                    break;
    	                case "/edicaomedico":
    	                	apresentaFormEdicaoMedicos(request, response);
    	                    break;
    	                case "/atualizamedico":
    	                	atualizaMedico(request, response);
    	                    break;
    	                case "/edicaopaciente":
    	                	apresentaFormEdicaoPaciente(request, response);
    	                    break;
    	                case "/atualizapaciente":
    	                	atualizaPaciente(request, response);
    	                    break;
    	                default:
    	                    lista(request, response);
    	                    break;
    	            }
    	        } catch (RuntimeException | IOException | ServletException e) {
    	            throw new ServletException(e);
    	        }
  
    	} else {
    		erros.add("Acesso não autorizado!");
    		erros.add("Apenas Papel [ADMIN] tem acesso a essa página");
    		request.setAttribute("mensagens", erros);
    		RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
    		rd.forward(request, response);
    	}
    }
    
    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MedicoDAO medicodao;
		medicodao = new MedicoDAO();
		List<Medico> listaMedicos = medicodao.getAll();
	    request.setAttribute("listaMedicos", listaMedicos);
	    
	    PacienteDAO pacientedao;
		pacientedao = new PacienteDAO();
		List<Paciente> listaPacientes = pacientedao.getAll();
	    request.setAttribute("listaPacientes", listaPacientes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/index.jsp");
        dispatcher.forward(request, response);
    }

    
    private void apresentaFormCadastroMedicos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MedicoDAO medicodao;
		medicodao = new MedicoDAO();
		List<Medico> listaMedicos = medicodao.getAll();
	    request.setAttribute("listaMedicos", listaMedicos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formulario_medicos.jsp");
        dispatcher.forward(request, response);
    }
    
    private void apresentaFormCadastroPacientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formulario_pacientes.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insereMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String nome = request.getParameter("nome");
    	 String login = request.getParameter("login");
    	 String senha = request.getParameter("senha");
    	 String especialidade = request.getParameter("especialidade");
    	 String crm = request.getParameter("crm");
         
    	 Medico medico = new Medico(nome, login, senha, especialidade, crm);
    	 MedicoDAO medicodao = new MedicoDAO();
         medicodao.insert(medico);
         
         response.sendRedirect("lista");
    }
    
    private void inserePaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String sexo;
        String nome = request.getParameter("nome");
	   	String login = request.getParameter("login");
	   	String senha = request.getParameter("senha");
	   	String cpf = request.getParameter("cpf");
	   	String telefone = request.getParameter("telefone");
	   	String feminino = request.getParameter("feminino");
	   	String masculino = request.getParameter("masculino");
	   	String nascimento = request.getParameter("nascimento");
	   	
	   	if (feminino == "" || feminino == null ) {
	   		sexo = masculino;
	   	}else {
	   		sexo = feminino;
	   	}
	        
	   	Paciente paciente = new Paciente(nome, login, senha, cpf, telefone, sexo, nascimento);
	   	PacienteDAO pacientedao = new PacienteDAO();
        pacientedao.insert(paciente);
        
        response.sendRedirect("lista");
    }
    
    
    private void removeMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String login = request.getParameter("login");
    	
    	Medico medico = new Medico(login);
    	MedicoDAO medicodao;
 		medicodao = new MedicoDAO();
 		medicodao.delete(medico);
 		
 		response.sendRedirect("lista");
    }
    
    private void removePaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String login = request.getParameter("login");
    	
    	Paciente paciente = new Paciente(login);
    	PacienteDAO pacientedao;
 		pacientedao = new PacienteDAO();
 		pacientedao.delete(paciente);
 		
 		response.sendRedirect("lista");
    }
    
    private void apresentaFormEdicaoMedicos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String login = request.getParameter("login");
    	
    	MedicoDAO medicodao;
		medicodao = new MedicoDAO();
		Medico medico = medicodao.getbyLogin(login);
	    request.setAttribute("medico", medico);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formulario_edicao_medicos.jsp");
        dispatcher.forward(request, response);
    }
    
    
    private void atualizaMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nome = request.getParameter("nome");
	   	String login = request.getParameter("login");
	   	String senha = request.getParameter("senha");
	   	String especialidade = request.getParameter("especialidade");
	   	String crm = request.getParameter("crm");
	    	
    	Medico medico = new Medico(nome, login, senha, especialidade, crm);
    	MedicoDAO medicodao;
 		medicodao = new MedicoDAO();
 		medicodao.update(medico);
 		
 		response.sendRedirect("lista");
    }
    
    private void apresentaFormEdicaoPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String login = request.getParameter("login");
    	
    	PacienteDAO pacientedao;
		pacientedao = new PacienteDAO();
		Paciente paciente = pacientedao.getbyLogin(login);
	    request.setAttribute("paciente", paciente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formulario_edicao_pacientes.jsp");
        dispatcher.forward(request, response);
    }


	private void atualizaPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nome = request.getParameter("nome");
	   	String login = request.getParameter("login");
	   	String senha = request.getParameter("senha");
	   	String telefone = request.getParameter("telefone");
	    
	   	
	   	Paciente paciente = new Paciente(nome, login, senha, telefone);
	   	PacienteDAO pacientedao = new PacienteDAO();
 		pacientedao.update(paciente);
 		
 		response.sendRedirect("lista");
 		
	}
    
    
}