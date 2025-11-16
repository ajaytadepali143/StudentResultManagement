<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.srms.model.ResultRow,com.srms.model.Student" %>
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
    <title>View Result</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>View Student Result</h2>

<form action="viewResult" method="post">
    Enter Roll No: <input type="text" name="rollNo" required>
    <button type="submit">View</button>
</form>
<br>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p class="error"><%= error %></p>
<%
    }

    Student student = (Student) request.getAttribute("student");
    if (student != null) {
        List<ResultRow> resultList = (List<ResultRow>) request.getAttribute("resultList");
        Integer totalObtained = (Integer) request.getAttribute("totalObtained");
        Integer totalMax = (Integer) request.getAttribute("totalMax");
        Double percentage = (Double) request.getAttribute("percentage");
        String status = (String) request.getAttribute("status");
%>

<h3>Student Details</h3>
<p>Name: <%= student.getName() %></p>
<p>Roll No: <%= student.getRollNo() %></p>
<p>Department: <%= student.getDepartment() %></p>
<p>Semester: <%= student.getSemester() %></p>

<h3>Marks</h3>
<%
        if (resultList == null || resultList.isEmpty()) {
%>
    <p>No marks found for this student.</p>
<%
        } else {
%>
<table>
    <tr>
        <th>Subject</th>
        <th>Max Marks</th>
        <th>Marks Obtained</th>
    </tr>
<%
            for (ResultRow r : resultList) {
%>
    <tr>
        <td><%= r.getSubjectName() %></td>
        <td><%= r.getMaxMarks() %></td>
        <td><%= r.getMarksObtained() %></td>
    </tr>
<%
            }
%>
</table>

<h3>Summary</h3>
<p>Total Obtained: <%= totalObtained %> / <%= totalMax %></p>
<p>Percentage: <%= String.format("%.2f", percentage) %>%</p>
<p>Status: <strong><%= status %></strong></p>
<%
        }
    }
%>

<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
