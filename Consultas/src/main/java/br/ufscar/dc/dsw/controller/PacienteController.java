package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.ufscar.dc.dsw.dao.PacienteDAO;
import br.ufscar.dc.dsw.domain.Consulta;

import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/paciente/*")
public class PacienteController extends HttpServlet {
	
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
    	} else if (usuario.getPapel().equals("PACIENTE")) {
    		    		
    		String action = request.getPathInfo();
	    	if (action == null) {
	            action = "";
	        }
	    	
	    	try {
	            switch (action) {
	                case "/cadastroconsulta":
	                    apresentaFormCadastroConsulta(request, response, usuario);
	                    break;
	                case "/insereconsulta":
	                    insereConsulta(request, response);
	                    break;
	                default:
	                    lista(request, response, usuario);
	                    break;
	            }
	        } catch (RuntimeException | IOException | ServletException e) {
	            throw new ServletException(e);
	        }
    
    	} else {
    		erros.add("Acesso não autorizado!");
    		erros.add("Apenas Papel [PACIENTE] tem acesso a essa página");
    		request.setAttribute("mensagens", erros);
    		RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
    		rd.forward(request, response);
    	}    	
    }
    
    private void lista(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException {
    	PacienteDAO pacientedao = new PacienteDAO();
		List<Consulta> listaConsultas = pacientedao.getConsultas(usuario.getLogin());
	    request.setAttribute("listaConsultas", listaConsultas);
	    
	    request.setAttribute("login", usuario.getNome());
	    
	   
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/paciente/index.jsp");
        dispatcher.forward(request, response);
    }
    
    private void apresentaFormCadastroConsulta(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException {
    	request.setAttribute("paciente", usuario);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/paciente/formulario_consultas.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insereConsulta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nomemedico = request.getParameter("nomemedico");
	   	String nomepaciente = request.getParameter("nomepaciente");
	   	String loginpaciente = request.getParameter("loginpaciente");
	   	String data = request.getParameter("data");
	        
	    Consulta consulta = new Consulta(nomepaciente, loginpaciente, nomemedico,  data);
	    PacienteDAO pacientedao = new PacienteDAO();
        pacientedao.insertConsulta(consulta);
        
        response.sendRedirect("lista");
    }
}
