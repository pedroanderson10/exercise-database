package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ConnectionFactory;
import pojo.Atracoes;

public class AtracoesDAO {
	
	private Connection connection;

	public AtracoesDAO() {
		
	}
	

	public boolean addAtracoes(Atracoes atracoes) {
		String sql = "INSERT INTO atracoes(nome, descricao) VALUES (?, ?)";
		this.connection = new ConnectionFactory().getConnection();
		try {
			// prepared statement para insercao
			PreparedStatement stmt = connection.prepareStatement(sql);

			// seta os valores
			stmt.setString(1, atracoes.getNome());
			stmt.setString(2, atracoes.getDescricao());

			int qtdRowsAffected = stmt.executeUpdate();
			stmt.close();
			if (qtdRowsAffected > 0)
				return true;
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		
		return false;
	}
	
	public boolean deleteAtracoes(String nome) {
		String sql = "DELETE FROM atracoes WHERE nome= ?  ";
		
		this.connection = new ConnectionFactory().getConnection();

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			// seta os valores
			stmt.setString(1, nome);

			int qtdRowsAffected = stmt.executeUpdate();
			stmt.close();
			if (qtdRowsAffected > 0)
				return true;
			return false;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public ArrayList<Atracoes> getListAtracoes() {
		String sql = "SELECT * FROM atracoes;";
		ArrayList<Atracoes> listaAtracoes = new ArrayList<Atracoes>();
		
		this.connection = new ConnectionFactory().getConnection();
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				
				String nome = rs.getString("nome");
				String descricao = rs.getString("descricao");
				
				Atracoes atracoes = new Atracoes(nome, descricao);
				
				listaAtracoes.add(atracoes);
			}
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaAtracoes;
	}
	
}
