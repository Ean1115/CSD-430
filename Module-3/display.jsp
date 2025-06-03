<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Application Data</title>
</head>
<body>
    <h2>Submitted Application Data</h2>
    <table border="1">
        <tr>
            <th>Field</th>
            <th>Value</th>
        </tr>
        <%-- Scriptlets to extract data from the form submission --%>
        <tr><td>Name</td><td><%= request.getParameter("name") %></td></tr>
        <tr><td>Email</td><td><%= request.getParameter("email") %></td></tr>
        <tr><td>Phone</td><td><%= request.getParameter("phone") %></td></tr>
        <tr><td>Experience</td><td><%= request.getParameter("experience") %></td></tr>
        <tr><td>Comments</td><td><%= request.getParameter("comments") %></td></tr>
    </table>
</body>
</html>
