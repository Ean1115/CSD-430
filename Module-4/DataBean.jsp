<%@ page import="com.example.DataBean" %>
<%
    DataBean data = new DataBean();
    data.setName("Alice");
    data.setAge(30);
    data.setEmail("alice@example.com");
    data.setCity("Springdale");
    data.setOccupation("Software Developer");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Data Display</title>
</head>
<body>
    <h1>User Information</h1>
    <table border="1">
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>Name</td><td><%= data.getName() %></td></tr>
        <tr><td>Age</td><td><%= data.getAge() %></td></tr>
        <tr><td>Email</td><td><%= data.getEmail() %></td></tr>
        <tr><td>City</td><td><%= data.getCity() %></td></tr>
        <tr><td>Occupation</td><td><%= data.getOccupation() %></td></tr>
    </table>
</body>
</html>
