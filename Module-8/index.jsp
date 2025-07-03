<%@ page import="model.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Movie Database Editor</title>
</head>
<body>
  <h1>🎬 Welcome to the Movie Database Editor</h1>
  <p>Select a movie title from the list below to view and edit its details.</p>

  <form action="editMovie.jsp" method="get">
    <label for="title">Choose a movie:</label>
    <select name="title" id="title">
      <%
        MovieBean movieBean = new MovieBean();
        List<String> titles = movieBean.getMovieTitles();
        for (String title : titles) {
      %>
          <option value="<%= title %>"><%= title %></option>
      <% } %>
    </select>
    <br><br>
    <input type="submit" value="Edit Selected Movie">
  </form>
</body>
</html>
