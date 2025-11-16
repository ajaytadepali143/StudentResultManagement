<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Add Student</h2>

<form action="addStudent" method="post">
    Roll No: <input type="text" name="rollNo" required><br><br>
    Name: <input type="text" name="name" required><br><br>
    Department: <input type="text" name="department"><br><br>
    Semester: <input type="number" name="semester" required><br><br>

    <button type="submit">Save</button>
</form>

<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <p class="message"><%= msg %></p>
<%
    }
%>

<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
