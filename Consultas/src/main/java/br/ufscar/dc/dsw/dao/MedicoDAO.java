package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Consulta;
import br.ufscar.dc.dsw.domain.Medico;


public class MedicoDAO extends GenericDAO {

    public void insert(Medico medico) {

        String sql = "INSERT INTO Medico (nome, login, senha, especialidade, crm) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setString(1, medico.getNome());
            statement.setString(2, medico.getLogin());
            statement.setString(3, medico.getSenha());
            statement.setString(4, medico.getEspecialidade());
            statement.setString(5, medico.getCrm());
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
            statement.setString(1, medico.getNome());
            statement.setString(2, medico.getLogin());
            statement.setString(3, medico.getSenha());
            statement.setString(4, "MEDICO");
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Medico> getAll() {

        List<Medico> listaMedicos = new ArrayList<>();

        String sql = "SELECT * from Medico m";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                
                String nome = resultSet.getString("nome");
                String login = resultSet.getString("login");
                String senha = resultSet.getString("senha");
                String especialidade = resultSet.getString("especialidade");
                String crm = resultSet.getString("crm");
                Medico medico = new Medico(nome, login, senha, especialidade, crm);
                listaMedicos.add(medico);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaMedicos;
    }

    public void delete(Medico medico) {
        String sql = "DELETE FROM Medico where login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, medico.getLogin());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
        
        sql = "DELETE FROM Usuario where login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, medico.getLogin());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
    }

    public void update(Medico medico) {
        String sql = "UPDATE Medico SET nome = ?, senha = ?, especialidade = ? WHERE login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, medico.getNome());
            statement.setString(2, medico.getSenha());
            statement.setString(3, medico.getEspecialidade());
            statement.setString(4, medico.getLogin());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        sql = "UPDATE Usuario SET nome = ?, senha = ? WHERE login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, medico.getNome());
            statement.setString(2, medico.getSenha());
            statement.setString(3, medico.getLogin());
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
    
    public Medico getbyLogin(String login) {
        Medico medico = null;

        String sql = "SELECT * from Medico WHERE login = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	
                String nome = resultSet.getString("nome");
                String senha = resultSet.getString("senha");
                String especialidade = resultSet.getString("especialidade");
                String crm = resultSet.getString("crm");

                medico = new Medico(nome, login, senha, especialidade, crm);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return medico;
    }
    
    public List<Consulta> getConsultas(String nomemedico_) {

        List<Consulta> listaConsultas = new ArrayList<>();

        String sql = "SELECT * from Consulta where nomemedico = ?";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, nomemedico_);
            ResultSet resultSet = statement.executeQuery();
            
            

            
            while (resultSet.next()) {
                
                String nomepaciente = resultSet.getString("nomepaciente");
                String cpfpaciente = resultSet.getString("cpfpaciente");
                String nomemedico = resultSet.getString("nomemedico");
                String data = resultSet.getString("datahora");
                Consulta consulta = new Consulta(nomepaciente, cpfpaciente, nomemedico, data);
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
    
}