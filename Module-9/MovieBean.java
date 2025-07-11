// MovieBean.java
package model;

import java.sql.*;
import java.util.*;

public class MovieBean {
    private Connection conn;

    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/csd430", 
                "yourUser", 
                "yourPass"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //  Get all movie titles (keys)
    public List<String> getMovieTitles() {
        List<String> titles = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT title FROM ean_movies_data")) {

            while (rs.next()) {
                titles.add(rs.getString("title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return titles;
    }

    //  Get all movies as List<Map<String, String>>
    public List<Map<String, String>> getAllMovies() {
        List<Map<String, String>> movies = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM ean_movies_data")) {

            ResultSetMetaData meta = rs.getMetaData();
            while (rs.next()) {
                Map<String, String> movie = new LinkedHashMap<>();
                for (int i = 1; i <= meta.getColumnCount(); i++) {
                    movie.put(meta.getColumnLabel(i), rs.getString(i));
                }
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    //  Get movie details by title
    public Map<String, String> getMovieByTitle(String title) {
        Map<String, String> movie = new LinkedHashMap<>();
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM ean_movies_data WHERE title = ?")) {
            ps.setString(1, title);
            try (ResultSet rs = ps.executeQuery()) {
                ResultSetMetaData meta = rs.getMetaData();
                if (rs.next()) {
                    for (int i = 1; i <= meta.getColumnCount(); i++) {
                        movie.put(meta.getColumnLabel(i), rs.getString(i));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }

    //  Delete movie by title
    public boolean deleteMovieByTitle(String title) {
        try (PreparedStatement ps = conn.prepareStatement("DELETE FROM ean_movies_data WHERE title = ?")) {
            ps.setString(1, title);
            int affected = ps.executeUpdate();
            return affected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;


public boolean updateMovie(String originalTitle, Map<String, String> updatedData) {
    StringBuilder sql = new StringBuilder("UPDATE ean_movies_data SET ");
    List<String> columns = new ArrayList<>();
    for (String column : updatedData.keySet()) {
        columns.add(column + " = ?");
    }
    sql.append(String.join(", ", columns));
    sql.append(" WHERE title = ?");

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        int index = 1;
        for (String column : updatedData.keySet()) {
            ps.setString(index++, updatedData.get(column));
        }
        ps.setString(index, originalTitle);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;

        }
    }
}
