<form action="deleteMovieResult.jsp" method="post">
    <select name="title">
        <c:forEach var="t" items="${titles}">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Delete">
</form>

<table>
    <thead>
        <tr><th>Title</th><th>Year</th><!-- Add more column headers --></tr>
    </thead>
    <tbody>
        <c:forEach var="movie" items="${movies}">
            <tr>
                <td>${movie["title"]}</td>
                <td>${movie["year"]}</td>
                <!-- More cells as needed -->
            </tr>
        </c:forEach>
    </tbody>
</table>
