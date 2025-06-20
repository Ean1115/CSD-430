<%@ page import="java.util.*, model.MovieBean" %>
<jsp:useBean id="movieBean" class="model.MovieBean" scope="application" />

<%
    String selectedTitle = request.getParameter("title");
    Map<String, String> movie = movieBean.getMovieByTitle(selectedTitle);
%>

<html>
<head><title>Movie Details</title></head>
<body>
    <h2>Details for "<%= selectedTitle %>"</h2>
    <p>This record includes detailed information about the selected movie.</p>

    <table border="1">
        <thead>
            <tr>
                <% for (String field : movie.keySet()) { %>
                    <th><%= field.toUpperCase().replace("_", " ") %></th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <tr>
                <% for (String value : movie.values()) { %>
                    <td><%= value %></td>
                <% } %>
            </tr>
        </tbody>
    </table>
</body>
</html>
