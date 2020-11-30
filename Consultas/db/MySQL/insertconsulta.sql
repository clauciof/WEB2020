create table Consulta(

	nomepaciente varchar(256) not null,
	loginpaciente varchar(20) not null,
	nomemedico varchar(256) not null,
	loginmedico varchar(20),
 	datahora varchar(20) not null,
	PRIMARY KEY (loginpaciente, datahora),
	FOREIGN KEY (nomepaciente) REFERENCES Paciente(nome),
	FOREIGN KEY (loginpaciente) REFERENCES Paciente(login),
	FOREIGN KEY (nomemedico) REFERENCES Medico(nome),
	FOREIGN KEY (loginmedico) REFERENCES Medico(login)
	
	
	
	);

insert into Consulta(nomepaciente, loginpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', 'Ricardo', 'medico1', '28/11/2020 14:30');

insert into Consulta(nomepaciente, loginpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', 'Ricardo', 'medico1', '04/12/2020 14:30');




String loginpaciente ="";
    	String data ="";
    	String loginmedico="";
    	String sql = "SELECT loginpaciente, datahora FROM Consulta WHERE loginpaciente = ? AND datahora = ?";
    	
    			try {
    	            Connection conn = this.getConnection();
    	            PreparedStatement statement = conn.prepareStatement(sql);

    	            statement.setString(1, consulta.getLoginpaciente());
    	            statement.setString(2, consulta.getData());
    	            ResultSet resultSet = statement.executeQuery();
    	            
    	            

    	            
    	            while (resultSet.next()) {   	              
    	            	loginpaciente = resultSet.getString("loginpaciente");
    	                data = resultSet.getString("datahora");
    	            }
    	           
    	            resultSet.close();
    	            statement.close();
    	            conn.close();
    	            
    	        } catch (SQLException e) {
    	            throw new RuntimeException(e);
    	        }
    			
    			 if( ( loginpaciente == consulta.getLoginpaciente() && data == consulta.getData() ) ) {
 	            	return;
 	            }
    		
    			 
    		    sql = "SELECT nomemedico, datahora FROM Consulta WHERE nomemedico = ? AND datahora = ?";
    		    	
        			try {
        	            Connection conn = this.getConnection();
        	            PreparedStatement statement = conn.prepareStatement(sql);

        	            statement.setString(1, consulta.getNomeMedico());
        	            statement.setString(2, consulta.getData());
        	            ResultSet resultSet = statement.executeQuery();
        	            
        	            

        	            
        	            while (resultSet.next()) {   	              
        	            	loginmedico = resultSet.getString("nomemedico");
        	                data = resultSet.getString("datahora");
        	            }
        	           
        	            resultSet.close();
        	            statement.close();
        	            conn.close();
        	            
        	        } catch (SQLException e) {
        	            throw new RuntimeException(e);
        	        }
        			
        			 if( ( loginmedico == consulta.getNomeMedico() && data == consulta.getData() ) ) {
     	            	return;
     	            }