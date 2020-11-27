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
    	                case "/cadastropacientes":
    	                    apresentaFormCadastroPacientes(request, response);
    	                case "/insere_medico":
    	                    insereMedico(request, response);
    	                case "/insere_paciente":
    	                    inserePaciente(request, response);
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
        request.setCharacterEncoding("UTF-8");
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
    
    private void inserePaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
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
}