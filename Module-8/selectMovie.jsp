<%@ page import="model.MovieBean" %>
<%@ page import="java.util.List" %>
<%
  MovieBean bean = new MovieBean();
  List<String> titles = bean.getMovieTitles();
%>
<form action="editMovie.jsp" method="get">
  <select name="title">
    <% for(String t : titles) { %>
      <option value="<%=t%>"><%=t%></option>
    <% } %>
  </select>
  <input type="submit" value="Edit Movie">
</form>
