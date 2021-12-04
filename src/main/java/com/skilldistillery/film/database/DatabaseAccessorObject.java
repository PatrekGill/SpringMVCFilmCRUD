package com.skilldistillery.film.database;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public class DatabaseAccessorObject implements DatabaseAccessor {
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	private static final String USER = "student";
	private static final String PASSWORD = "student";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		}
	}

	/* ------------------------------------------------
	    openConnection
	------------------------------------------------ */
	private Connection openConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}

		return connection;
	}
	
	
	/* ------------------------------------------------
	    getNumberOfFilms
	------------------------------------------------ */
	private int getNumberOfFilms() {
		int numberOfFilms = 0;
		String checkSQL = "SELECT COUNT(*) FROM film";
		
		Connection connection = null;
		try {
			connection = openConnection();
			PreparedStatement checkStatement = connection.prepareStatement(checkSQL);
			checkStatement.executeQuery();
			ResultSet rs = checkStatement.getResultSet();
			if (rs.next()) {
				numberOfFilms = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return numberOfFilms;
	}
	
	
	/* ------------------------------------------------
	    updateFilmData
	------------------------------------------------ */
	public Film updateFilmData(Film film, String column, Object newValue) {
		Film returnedFilm = null;
		int updateFilm = 0;
		String sqlString = "UPDATE film SET " + column + " = " + newValue + " WHERE film.id = " + film.getId();

		Connection connection = null;
		try {
			connection = openConnection();
			connection.setAutoCommit(false);

			PreparedStatement updateFilmStatement = connection.prepareStatement(sqlString,Statement.RETURN_GENERATED_KEYS);
			updateFilm = updateFilmStatement.executeUpdate();
			
			
			connection.commit();
//			connection.rollback();
			updateFilmStatement.close();
			connection.close();
		
		} catch (SQLException e) {
			System.err.println("Error during update");
			e.printStackTrace();

			if (connection != null) {
				try {
					connection.rollback();
					connection.close();
				} catch (SQLException e1) {
					System.err.println("Error rolling back.");
					e1.printStackTrace();
				}
			}
		}
		
		
		if (updateFilm == 1) {
			returnedFilm = findFilmById(film.getId());
		}
		return returnedFilm;
	}
	
	
	/* ------------------------------------------------
	    createFilm
	------------------------------------------------ */
	public Film createFilm(Film film) {
		Film returnedFilm = null;
		String sqlString = "INSERT INTO film (title, description, rating, language_id) " 
							+ "VALUES (?, ?, ?, ?)";
		
		Connection connection = null;
		try {
			connection = openConnection();
			connection.setAutoCommit(false);
			PreparedStatement addFilmStatement = connection.prepareStatement(sqlString,Statement.RETURN_GENERATED_KEYS);
			addFilmStatement.setString(1,film.getTitle());
			addFilmStatement.setString(2,film.getDescription());
			addFilmStatement.setString(3,film.getRating());
			addFilmStatement.setInt(4,film.getLanguageId());
			addFilmStatement.executeUpdate();
			
			ResultSet key = addFilmStatement.getGeneratedKeys();
			if (key.next()) {
				film.setId(key.getInt(1));
				returnedFilm = film;
			}
			
			connection.commit();
//			connection.rollback();
			addFilmStatement.close();
			connection.close();
			
		} catch (SQLException e) {
			System.err.println("Error during insert");
			e.printStackTrace();

			if (connection != null) {
				try {
					connection.rollback();
					connection.close();
				} catch (SQLException e1) {
					System.err.println("Error rolling back.");
					e1.printStackTrace();
				}
			}
		}
		
		return returnedFilm; 
	}
	
	
	
	/* ------------------------------------------------
	    deleteFilm
	------------------------------------------------ */
	public boolean deleteFilm(Film film) {
		boolean deleted = false;
		String deleteSQL = "DELETE FROM film WHERE film.id = ?";
		
		Connection connection = null;
		try {
			connection = openConnection();
			connection.setAutoCommit(false);
			
			System.out.println("Entries Prior To Deletion: " + getNumberOfFilms());
			
			PreparedStatement addFilmStatement = connection.prepareStatement(deleteSQL);
			addFilmStatement.setInt(1,film.getId());
			addFilmStatement.executeUpdate();
						
			connection.commit();
			System.out.println("Entries After Deletion: " + getNumberOfFilms());
//			connection.rollback();
			addFilmStatement.close();
			connection.close();
			
		} catch (SQLException e) {
			System.err.println("Error during deletion");
			e.printStackTrace();

			if (connection != null) {
				try {
					connection.rollback();
					connection.close();
				} catch (SQLException e1) {
					System.err.println("Error rolling back.");
					e1.printStackTrace();
				}
			}
		}
		
		return deleted; 
	}
	
	/* ------------------------------------------------
	    createFilmFromResultSet
	------------------------------------------------ */
	private Film createFilmFromResultSet(ResultSet resultSet) throws SQLException {
		int languageId = resultSet.getInt("language_id");
		
		return new Film(
			resultSet.getInt("id"),
			resultSet.getString("title"), 
			resultSet.getString("description"), 
			resultSet.getInt("release_year"), 
			languageId, 
			resultSet.getInt("rental_duration"),
			resultSet.getDouble("rental_rate"),
			resultSet.getInt("length"),
			resultSet.getDouble("replacement_cost"),
			resultSet.getString("rating"),
			resultSet.getString("special_features"),
			getLanguageNameById(languageId)
		);
	}
	
	
	
	/* ------------------------------------------------
	    createActorFromResultSet
	------------------------------------------------ */
	private Actor createActorFromResultSet(ResultSet resultSet) throws SQLException {
		return new Actor(
			resultSet.getInt("id"),
			resultSet.getString("first_name"),
			resultSet.getString("last_name")
		);
	}
	
	
	
	/* ------------------------------------------------
	    getLanguageNameById
	------------------------------------------------ */
	public String getLanguageNameById(int languageId) {
		String string = "Unknown Language (ID: " + languageId + ")";
		String sql = "SELECT * FROM language WHERE id = ?";
		
		try {
			Connection connection = openConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, languageId);
			ResultSet resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
				string = resultSet.getString("name");
			}
			
			resultSet.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return string;	
	}
	
	
	
	/* ------------------------------------------------
	    findFilmById
	------------------------------------------------ */
	@Override
	public Film findFilmById(int filmId) {
		Film film = null;
		String sql = "SELECT * FROM film WHERE film.id = ?";
		
		try {
			Connection connection = openConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, filmId);
			ResultSet resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
				film = createFilmFromResultSet(resultSet);
			}
			
			resultSet.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return film;
	}
	
	
	/* ------------------------------------------------
	    findActorById
	------------------------------------------------ */
	@Override
	public Actor findActorById(int actorId) {
		Actor actor = null;
		
		String sql = "SELECT id, first_name, last_name FROM actor WHERE id = ?";

		try {
			Connection connection = openConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, actorId);
			ResultSet resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
				actor = createActorFromResultSet(resultSet);
			}
			
			resultSet.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return actor;
	}
	
	
	/* ------------------------------------------------
	    findActorsByFilmId
	------------------------------------------------ */
	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actors = new ArrayList<>();
		
		String sql = 
				"SELECT * "
			+ 	"FROM actor "
			+ 		"JOIN film_actor "
			+ 			"ON film_actor.actor_id = actor.id "
			+ 	"WHERE film_actor.film_id = ?";

		try {
			Connection connection = openConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, filmId);
			ResultSet resultSet = statement.executeQuery();
			
			while (resultSet.next()) {
				Actor actor = createActorFromResultSet(resultSet);
				actors.add(actor);
			}
			
			resultSet.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return actors;
	}
	
	
	/* ------------------------------------------------
	    findFilmsByKeyword
	----------------------------------------------- */
	public List<Film> findFilmsByKeyword(String keyword) {
		List<Film> films = new ArrayList<>();
		
		if (keyword.equals("")) {
			return films;
		}
		
		String sql = 
				"SELECT * FROM film "
			+ 	"WHERE description LIKE ? OR title LIKE ?";
		
		try {
			Connection connection = openConnection();
			PreparedStatement statement = connection.prepareStatement(sql);
			keyword = "%" + keyword + "%";
			statement.setString(1, keyword);
			statement.setString(2, keyword);
			ResultSet resultSet = statement.executeQuery();
			
			while (resultSet.next()) {
				Film film = createFilmFromResultSet(resultSet);
				films.add(film);
			}
			
			resultSet.close();
			statement.close();
			connection.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return films;
	}

}
