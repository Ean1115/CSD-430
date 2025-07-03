<%@ page import="model.MovieBean" %>
<%@ page import="java.util.*" %>
<%
  String selectedTitle = request.getParameter("title");
  MovieBean bean = new MovieBean();
  Map<String, String> movie = bean.getMovieByTitle(selectedTitle);
%>
<form action="confirmMovie.jsp" method="post">
  <p><strong>Title:</strong> <%=movie.get("title")%></p>
  <input type="hidden" name="title" value="<%=movie.get("title")%>">
  Release Year: <input type="text" name="release_year" value="<%=movie.get("release_year")%>"><br>
  Genre: <input type="text" name="genre" value="<%=movie.get("genre")%>"><br>
  Director: <input type="text" name="director" value="<%=movie.get("director")%>"><br>
  Rating: <input type="text" name="rating" value="<%=movie.get("rating")%>"><br>
  <input type="submit" value="Update">
</form>
