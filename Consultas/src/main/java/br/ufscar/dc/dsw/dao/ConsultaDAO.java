package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Consulta;



public class ConsultaDAO extends GenericDAO {

    public List<Consulta> getConsultas() {

        List<Consulta> listaConsultas = new ArrayList<>();

        String sql = "SELECT * from Consulta ";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            
            

            
            while (resultSet.next()) {
                
                String nomepaciente = resultSet.getString("nomepaciente");
                String loginpaciente = resultSet.getString("cpfpaciente");
                String cpfpaciente = resultSet.getString("cpfpaciente");
                String nomemedico = resultSet.getString("nomemedico");
                String loginmedico= resultSet.getString("loginmedico");
                String data = resultSet.getString("datahora");
                Consulta consulta = new Consulta(nomepaciente, loginpaciente, cpfpaciente, nomemedico, loginmedico, data);
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