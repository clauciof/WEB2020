<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<fmt:bundle basename="messages">
<head>
		<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="appointmentSys"/></title>
</head>
<body>
 <nav class="navbar navbar-light bg-light justify-content-between">
		  <a class="navbar-brand"><fmt:message key="pagPac"/></a>
		  <form class="form-inline">
		    <a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/logout.jsp"><fmt:message key="exit"/></a>
		  </form>
		</nav>
    	
    	<div class="container mt-3">
        
	        <div align="center">
			<h1><fmt:message key="cadastroConsultas"/></h1>
				<h2>
					<a href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="mainMenu"/></a> &nbsp;&nbsp;&nbsp; 
				</h2>		
		</div>
		
		<div class="container mt-3">
		
		<form method="post" action="insereconsulta">
	        	<div class="form-group">
				    <label for="Medico"><fmt:message key="doc"/></label>
				    <select id="loginmedico" name="nomemedico">
		   				<c:forEach items="${medicos}" var="medico">
		   					<option value="${medico.login}">${medico.login}</option>
		   						
		   				</c:forEach>
   					</select>
				    
				    <input type="hidden" class="form-control" id="nomepaciente" aria-describedby="emailHelp" name="nomepaciente" value="${paciente.nome}">
				    <input type="hidden" class="form-control" id="loginpaciente" aria-describedby="emailHelp" name="loginpaciente" value="${paciente.login}">
				 </div>
			  <div class="form-group">
				  <label for="cpf">CPF</label>
				  <input type="text" class="form-control" id="cpfpaciente" aria-describedby="emailHelp" name="cpfpaciente">
			  </div>
			  <div class="form-group">
			    <label for="data"><fmt:message key="dataHora"/></label>
			    <input type="text" class="form-control"  id="data" name="data">
			  </div>
			  <input class="btn btn-primary" type="submit" value=<fmt:message key="save"/> />
	    </form>
			
		</div>
		
		
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	        
	
</body>
</fmt:bundle>
</html>