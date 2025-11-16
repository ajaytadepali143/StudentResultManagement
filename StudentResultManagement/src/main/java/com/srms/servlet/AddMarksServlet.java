package com.srms.servlet;

import com.srms.dao.MarkDAO;
import com.srms.dao.StudentDAO;
import com.srms.dao.SubjectDAO;
import com.srms.model.Student;
import com.srms.model.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addMarks")
public class AddMarksServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();
    private SubjectDAO subjectDAO = new SubjectDAO();
    private MarkDAO markDAO = new MarkDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String rollNo = request.getParameter("rollNo");
        String subjectCode = request.getParameter("subjectCode");
        int marksObtained = Integer.parseInt(request.getParameter("marksObtained"));

        Student student = studentDAO.getByRollNo(rollNo);
        Subject subject = subjectDAO.getByCode(subjectCode);

        if (student == null || subject == null) {
            request.setAttribute("msg", "Invalid roll number or subject code.");
            request.getRequestDispatcher("add_marks.jsp").forward(request, response);
            return;
        }

        boolean success = markDAO.addOrUpdateMark(student.getId(), subject.getId(), marksObtained);
        if (success) {
            request.setAttribute("msg", "Marks saved successfully!");
        } else {
            request.setAttribute("msg", "Error saving marks.");
        }
        request.getRequestDispatcher("add_marks.jsp").forward(request, response);
    }
}
