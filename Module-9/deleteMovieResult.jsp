<jsp:useBean id="bean" class="model.MovieBean" scope="request" />
<%
    String titleToDelete = request.getParameter("title");
    if (titleToDelete != null && !titleToDelete.isEmpty()) {
        bean.deleteMovieByTitle(titleToDelete);
    }
    List<String> titles = bean.getMovieTitles();
    // Call a method like getAllMovies() to get all rows
    request.setAttribute("titles", titles);
    request.setAttribute("movies", yourListOfMovies); // build this map or bean list
%>
<jsp:forward page="deleteMovieForm.jsp" />
