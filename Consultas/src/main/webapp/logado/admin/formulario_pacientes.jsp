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
<title><fmt:message key="cadastroPac"/></title>
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
			<h1><fmt:message key="cadastroPac"/></h1>
				<h2>
					<a href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="mainMenu"/></a> &nbsp;&nbsp;&nbsp; 
				</h2>		
		</div>
		
		<div class="container mt-3">
		
		<form method="post" action="inserepaciente">
	        	<div class="form-group">
				    <label for="Paciente"><fmt:message key="paciente"/></label>
				    <input type="text" class="form-control" id="paciente" aria-describedby="emailHelp" name="nome">
			  </div>
			  <div class="form-group">
			    <label for="login">Login</label>
			    <input type="text" class="form-control"  id="login" name="login">
			  </div>
			  <div class="form-group">
			    <label for="senha"><fmt:message key="senha"/></label>
			    <input type="text" class="form-control"  id="senha" name="senha">
			  </div>
			  <div class="form-group">
			    <label for="cpf">CPF</label>
			    <input type="text" class="form-control"  id="cpf" name="cpf">
			  </div>
			  <div class="form-group">
			    <label for="Telefone"><fmt:message key="tel"/></label>
			    <input type="text" class="form-control"  id="telefone" name="telefone">
			  </div>
			  <div class="form-check form-check-inline">
			      <input class="form-check-input" type="checkbox" id="Feminino" value="Feminino" name="feminino">
				  <label class="form-check-label" for="inlineCheckbox1"><fmt:message key="feminino"/></label>
			  </div>
			  <div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="Masculino" value="Masculino" name="masculino">
				  <label class="form-check-label" for="inlineCheckbox2"><fmt:message key="masculino"/></label>
			  </div>
			  <div class="form-group">
			    <label for="nascimento"><fmt:message key="birthdate"/></label>
			    <input type="text" class="form-control"  id="nascimento" name="nascimento">
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