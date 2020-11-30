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

import br.ufscar.dc.dsw.domain.Consulta;
import br.ufscar.dc.dsw.domain.Usuario;
import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/medico/*")
public class MedicoController extends HttpServlet {

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
    	} else if (usuario.getPapel().equals("MEDICO")) {
    		String action = request.getPathInfo();
	    	if (action == null) {
	            action = "";
	        }
	    	
	    	try {
	            switch (action) {
	                default:
	                    lista(request, response, usuario);
	                    break;
	            }
	        } catch (RuntimeException | IOException | ServletException e) {
	            throw new ServletException(e);
	        }
    	} else {
    		erros.add("Acesso não autorizado!");
    		erros.add("Apenas Papel [Medico] tem acesso a essa página");
    		request.setAttribute("mensagens", erros);
    		RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
    		rd.forward(request, response);
    	}    	
    }
    
    private void lista(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException {
    	MedicoDAO medicodao = new MedicoDAO();
		List<Consulta> listaConsultas = medicodao.getConsultas(usuario.getLogin());
	    request.setAttribute("listaConsultas", listaConsultas);
	    
	    request.setAttribute("login", usuario.getNome());
	    
	   
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/medico/index.jsp");
        dispatcher.forward(request, response);
    }
}
