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
		  <a class="navbar-brand"><fmt:message key="pagMed"/></a>
		  <form class="form-inline">
		    <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/logout.jsp"><fmt:message key="exit"/></a>
		  </form>
		</nav>
    	
    	<div class="container mt-3">
        
	        <div align="center">
			<h1><fmt:message key="pagMed"/></h1>
				<h2>
					<a href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="mainMenu"/></a> &nbsp;&nbsp;&nbsp; 						
						
				</h2>
			</div>
	
		<div class="container mt-5" >
			<h4><fmt:message key="suasConsultas"/> ${login} </h4>
	        	<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th><fmt:message key="paciente"/></th>
					  <th>CPF</th>
					  <th><fmt:message key="doc"/></th>
					  <th><fmt:message key="dataHora"/></th>
				    </tr>
				  </thead>
				  <tbody>
				   <c:forEach var="consulta" items="${requestScope.listaConsultas}">
						<tr>
							<td>${consulta.nomePaciente}</td>
							<td>${consulta.cpf}</td>
							<td>${login}</td>
							<td>${consulta.data}</td>
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
