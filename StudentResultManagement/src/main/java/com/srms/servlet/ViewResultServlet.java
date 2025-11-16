package com.srms.servlet;

import com.srms.dao.MarkDAO;
import com.srms.dao.StudentDAO;
import com.srms.model.ResultRow;
import com.srms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewResult")
public class ViewResultServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();
    private MarkDAO markDAO = new MarkDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String rollNo = request.getParameter("rollNo");
        Student student = studentDAO.getByRollNo(rollNo);

        if (student == null) {
            request.setAttribute("error", "Student not found for roll number: " + rollNo);
            request.getRequestDispatcher("view_result.jsp").forward(request, response);
            return;
        }

        List<ResultRow> resultList = markDAO.getResultForStudent(student.getId());

        int totalObtained = 0;
        int totalMax = 0;
        for (ResultRow row : resultList) {
            totalObtained += row.getMarksObtained();
            totalMax += row.getMaxMarks();
        }

        double percentage = 0.0;
        String status = "No Marks";
        if (totalMax > 0) {
            percentage = (totalObtained * 100.0) / totalMax;
            status = percentage >= 40.0 ? "PASS" : "FAIL";
        }

        request.setAttribute("student", student);
        request.setAttribute("resultList", resultList);
        request.setAttribute("totalObtained", totalObtained);
        request.setAttribute("totalMax", totalMax);
        request.setAttribute("percentage", percentage);
        request.setAttribute("status", status);

        request.getRequestDispatcher("view_result.jsp").forward(request, response);
    }
}
