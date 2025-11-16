<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.srms.model.Student" %>
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
    <title>Students List</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Students List</h2>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    if (students == null || students.isEmpty()) {
%>
    <p>No students found.</p>
<%
    } else {
%>
<table>
    <tr>
        <th>Roll No</th>
        <th>Name</th>
        <th>Department</th>
        <th>Semester</th>
    </tr>
<%
        for (Student s : students) {
%>
    <tr>
        <td><%= s.getRollNo() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getDepartment() %></td>
        <td><%= s.getSemester() %></td>
    </tr>
<%
        }
%>
</table>
<%
    }
%>

<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
