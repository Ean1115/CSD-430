// MovieBean.java
package model;

import java.sql.*;
import java.util.*;

public class MovieBean {
    private Connection conn;

    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csd430", "yourUser", "yourPass");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get all movie titles (keys)
    public List<String> getMovieTitles() {
        List<String> titles = new ArrayList<>();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT title FROM ean_movies_data");
            while (rs.next()) {
                titles.add(rs.getString("title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return titles;
    }

    // Get movie details by title
    public Map<String, String> getMovieByTitle(String title) {
        Map<String, String> movie = new LinkedHashMap<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ean_movies_data WHERE title = ?");
            ps.setString(1, title);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            if (rs.next()) {
                for (int i = 1; i <= meta.getColumnCount(); i++) {
                    movie.put(meta.getColumnLabel(i), rs.getString(i));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }
}
