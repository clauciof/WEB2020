<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<fmt:bundle basename="messages">	
    <head>
    	<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="menuSys"/></title>
    </head>
    <body>
    
	   <nav class="navbar navbar-light bg-light justify-content-between">
		  <a class="navbar-brand"><fmt:message key="pagAdm"/></a>
		  <form class="form-inline">
		    <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/logout.jsp"><fmt:message key="exit"/></a>
		  </form>
		</nav>
    	
    	<div class="container mt-3">
        
	        <div align="center">
			<h1><fmt:message key="gerenciamento"/></h1>
				<h2>
					<a href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="mainMenu"/></a> &nbsp;&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath}/admin/cadastromedicos"><fmt:message key="addDoc"/></a>&nbsp;&nbsp;&nbsp;
						<a
						href="${pageContext.request.contextPath}/admin/cadastropacientes"><fmt:message key="addPat"/></a>
				</h2>
			</div>
	
		<div class="container mt-5" >
			<h4><fmt:message key="docList"/></h4>
	        	<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th><fmt:message key="nome"/></th>
					  <th>Login</th>
					  <th><fmt:message key="senha"/></th>
					  <th><fmt:message key="especialidade"/></th>
					  <th>CRM</th>
				    </tr>
				  </thead>
				  <tbody>
				   <c:forEach var="medico" items="${requestScope.listaMedicos}">
						<tr>
							<td>${medico.nome}</td>
							<td>${medico.login}</td>
							<td>${medico.senha}</td>
							<td>${medico.especialidade}</td>
							<td>${medico.crm}</td>
							<td><a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/edicaomedico?login=${medico.login}"><fmt:message key="edit"/></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger" role="button"
								href="${pageContext.request.contextPath}/admin/remocaomedico?login=${medico.login}"
								onclick="return confirm('Tem certeza de que deseja excluir este item?');">
									<fmt:message key="remove"/> </a></td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
		</div>
		
		<div class="container mt-5">
			<h4><fmt:message key="patList"/></h4>
		        	<table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th><fmt:message key="nome"/></th>
					      <th>Login</th>
					      <th><fmt:message key="senha"/></th>
					      <th>CPF</th>
					      <th><fmt:message key="sexo"/></th>
					      <th><fmt:message key="tel"/></th>
					      <th><fmt:message key="birthdate"/></th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="paciente" items="${requestScope.listaPacientes}">
							<tr>
								<td>${paciente.nome}</td>
								<td>${paciente.login}</td>
								<td>${paciente.senha}</td>
								<td>${paciente.cpf}</td>
								<td>${paciente.sexo}</td>
								<td>${paciente.telefone}</td>
								<td>${paciente.nascimento}</td>
								<td><a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/edicaopaciente?login=${paciente.login}"><fmt:message key="edit"/></a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger" role="button"
									href="${pageContext.request.contextPath}/admin/remocaopaciente?login=${paciente.login}"
									onclick="return confirm('Tem certeza de que deseja excluir este item?');">
										<fmt:message key="remove"/> </a></td>
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
    </fmt:bundle>
</html>
