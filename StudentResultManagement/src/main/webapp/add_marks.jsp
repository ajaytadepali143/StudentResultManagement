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
    <title>Add / Update Marks</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Add / Update Marks</h2>

<form action="addMarks" method="post">
    Roll No: <input type="text" name="rollNo" required><br><br>
    Subject Code (e.g., CS101): <input type="text" name="subjectCode" required><br><br>
    Marks Obtained: <input type="number" name="marksObtained" required><br><br>

    <button type="submit">Save Marks</button>
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
