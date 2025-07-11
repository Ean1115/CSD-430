<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="bean" class="model.MovieBean" scope="session" />

<%
    String titleToDelete = request.getParameter("deleteTitle");
    String editSelection = request.getParameter("editTitle");
    String updateTitle = request.getParameter("updateTitle");

    // Delete logic
    if (titleToDelete != null && !titleToDelete.isEmpty()) {
        bean.deleteMovieByTitle(titleToDelete);
    }

    // Update logic
    if (updateTitle != null && !updateTitle.isEmpty()) {
        Map<String, String> updatedMovie = new LinkedHashMap<>();
        updatedMovie.put("year", request.getParameter("year"));
        updatedMovie.put("genre", request.getParameter("genre"));
        // Add more fields as needed
        bean.updateMovie(updateTitle, updatedMovie);
    }

    // Fetch all movies and titles
    List<String> titles = bean.getMovieTitles();
    List<Map<String, String>> movies = bean.getAllMovies();
    request.setAttribute("titles", titles);
    request.setAttribute("movies", movies);

    // Optional: Movie selected for editing
    Map<String, String> movieToEdit = null;
    if (editSelection != null && !editSelection.isEmpty()) {
        movieToEdit = bean.getMovieByTitle(editSelection);
        request.setAttribute("movieToEdit", movieToEdit);
    }
%>

<html>
<head>
    <title>Movie Dashboard</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 8px; border: 1px solid #ccc; }
        th { background-color: #eee; }
        form { margin-bottom: 20px; }
    </style>
</head>
<body>

<h2>All Movies</h2>
<table>
    <thead>
        <tr>
            <c:if test="${not empty movies}">
                <c:forEach var="col" items="${movies[0].keySet()}">
                    <th>${col}</th>
                </c:forEach>
            </c:if>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="movie" items="${movies}">
            <tr>
                <c:forEach var="val" items="${movie.values()}">
                    <td>${val}</td>
                </c:forEach>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Delete Form -->
<h3>Delete a Movie</h3>
<form method="post" action="index.jsp">
    <select name="deleteTitle">
        <c:forEach var="t" items="${titles}">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Delete">
</form>

<!-- Edit Selection Form -->
<h3>Edit a Movie</h3>
<form method="post" action="index.jsp">
    <select name="editTitle">
        <c:forEach var="t" items="${titles}">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Edit">
</form>

<!-- Update Form -->
<c:if test="${not empty movieToEdit}">
    <h3>Update Movie: ${movieToEdit['title']}</h3>
    <form method="post" action="index.jsp">
        <input type="hidden" name="updateTitle" value="${movieToEdit['title']}">
        Year: <input type="text" name="year" value="${movieToEdit['year']}"><br>
        Genre: <input type="text" name="genre" value="${movieToEdit['genre']}"><br>
        <!-- Add more editable fields as needed -->
        <input type="submit" value="Update">
    </form>
</c:if>

</body>
</html>
