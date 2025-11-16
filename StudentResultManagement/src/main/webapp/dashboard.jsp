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
    <title>SRMS - Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Welcome, <%= username %></h2>

<nav>
    <a href="add_student.jsp">Add Student</a>
    <a href="listStudents">View Students</a>
    <a href="add_marks.jsp">Add / Update Marks</a>
    <a href="view_result.jsp">View Result</a>
    <a href="logout">Logout</a>
</nav>

<p>Select an action from the menu.</p>
</body>
</html>
