package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Consulta;
import br.ufscar.dc.dsw.domain.Paciente;


public class PacienteDAO extends GenericDAO {

    public void insert(Paciente paciente) {

        String sql = "INSERT INTO Paciente (nome, login, senha) VALUES (?, ?, ?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setString(1, paciente.getNome());
            statement.setString(2, paciente.getLogin());
            statement.setString(3, paciente.getSenha());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        sql = "INSERT INTO Usuario (nome, login, senha, papel) VALUES (?, ?, ?, ?)";
        
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setString(1, paciente.getNome());
            statement.setString(2, paciente.getLogin());
            statement.setString(3, paciente.getSenha());
            statement.setString(4, "PACIENTE");
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    
    public void insertConsulta(Consulta consulta) {

        String sql = "INSERT INTO Consulta (nomepaciente, loginpaciente, nomemedico, datahora) VALUES (?, ?, ?, ?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setString(1, consulta.getNomePaciente());
            statement.setString(2, consulta.getLoginPaciente());
            statement.setString(3, consulta.getNomeMedico());
            statement.setString(4, consulta.getData());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Paciente> getAll() {

        List<Paciente> listaPacientes = new ArrayList<>();

        String sql = "SELECT * from Paciente p";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                
                String nome = resultSet.getString("nome");
                String login = resultSet.getString("login");
                String senha = resultSet.getString("senha");
                Paciente paciente = new Paciente(nome, login, senha);
                listaPacientes.add(paciente);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPacientes;
    }
    
    public List<Consulta> getConsultas(String login) {

        List<Consulta> listaConsultas = new ArrayList<>();

        String sql = "SELECT * from Consulta where loginpaciente = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            
            

            
            while (resultSet.next()) {
                
                String nomepaciente = resultSet.getString("nomepaciente");
                String loginpaciente = resultSet.getString("loginpaciente");
                String nomemedico = resultSet.getString("nomemedico");
                String loginmedico= resultSet.getString("loginmedico");
                String data = resultSet.getString("datahora");
                Consulta consulta = new Consulta(nomepaciente, loginpaciente, nomemedico, loginmedico, data);
                listaConsultas.add(consulta);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaConsultas;
    }

    public void delete(Paciente paciente) {
        String sql = "DELETE FROM Paciente where login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, paciente.getLogin());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
    }

    public void update(Paciente paciente) {
        String sql = "UPDATE Paciente SET nome = ?, login = ?, senha = ? WHERE login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, paciente.getNome());
            statement.setString(2, paciente.getLogin());
            statement.setString(3, paciente.getSenha());
            statement.setString(4, paciente.getLogin());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*public Usuario getbyID(Long id) {
        Usuario usuario = null;

        String sql = "SELECT * from Medico WHERE id = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String nome = resultSet.getString("nome");
                String login = resultSet.getString("login");
                String senha = resultSet.getString("senha");
                String papel = resultSet.getString("papel");

                usuario = new Usuario(id, nome, login, senha, papel);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }*/
    
    public Paciente getbyLogin(String login_) {
        Paciente paciente = null;

        String sql = "SELECT * from Paciente WHERE login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, login_);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	
                String nome = resultSet.getString("nome");
                String senha = resultSet.getString("senha");
                String login = resultSet.getString("login");
                paciente = new Paciente(nome, login, senha);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return paciente;
    }
    
}