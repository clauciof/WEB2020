<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
    	<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu do Sistema</title>
    </head>
    <body>
    
	   <nav class="navbar navbar-light bg-light justify-content-between">
		  <a class="navbar-brand">Pagina do Administrador</a>
		  <form class="form-inline">
		    <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
		  </form>
		</nav>
    	
    	<div class="container mt-3">
        
	        <div align="center">
			<h1>Gerenciamento de Medicos e Pacientes</h1>
				<h2>
					<a href="${pageContext.request.contextPath}/index.jsp">Menu Principal</a> &nbsp;&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/admin/cadastromedicos">Adicione Novo Medico</a>&nbsp;&nbsp;&nbsp;
						<a
						href="${pageContext.request.contextPath}/admin/cadastropacientes">Adicione Novo Paciente</a>
				</h2>
			</div>
	
		<div class="container mt-5" >
			<h4>Lista de Medicos</h4>
	        	<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th>Nome</th>
					  <th>Login</th>
					  <th>Senha</th>
					  <th>Especialidade</th>
				    </tr>
				  </thead>
				  <tbody>
				   <c:forEach var="medico" items="${requestScope.listaMedicos}">
						<tr>
							<td>${medico.nome}</td>
							<td>${medico.login}</td>
							<td>${medico.senha}</td>
							<td>${medico.especialidade}</td>
							<td><a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/edicaomedico?login=${medico.login}">Edição</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger" role="button"
								href="${pageContext.request.contextPath}/admin/remocaomedico?login=${medico.login}"
								onclick="return confirm('Tem certeza de que deseja excluir este item?');">
									Remoção </a></td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
		</div>
		
		<div class="container mt-5">
			<h4>Lista de Pacientes</h4>
		        	<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th>Nome</th>
					      <th>Login</th>
					      <th>Senha</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="paciente" items="${requestScope.listaPacientes}">
							<tr>
								<td>${paciente.nome}</td>
								<td>${paciente.login}</td>
								<td>${paciente.senha}</td>
								<td><a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/edicao?id=${paciente.login}">Edição</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger" role="button"
									href="${pageContext.request.contextPath}/admin/remocao?id=${paciente.login}"
									onclick="return confirm('Tem certeza de que deseja excluir este item?');">
										Remoção </a></td>
							</tr>
						</c:forEach>
					  </tbody>
					</table>
	
		</div>
	</div>
	
	
	
	
	
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	        
    </body>
</html>
