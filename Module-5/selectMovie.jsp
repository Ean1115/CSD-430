<%@ page import="java.util.*, model.MovieBean" %>
<jsp:useBean id="movieBean" class="model.MovieBean" scope="application" />

<html>
<head><title>Select a Movie</title></head>
<body>
    <h2>Movie Selector</h2>
    <p>Please select a movie from the list below to view its information.</p>

    <form action="displayMovie.jsp" method="post">
        <label for="title">Choose a movie:</label>
        <select name="title" id="title">
            <%
                List<String> titles = movieBean.getMovieTitles();
                for (String t : titles) {
            %>
                <option value="<%= t %>"><%= t %></option>
            <%
                }
            %>
        </select>
        <input type="submit" value="Show Movie Info" />
    </form>
</body>
</html>
