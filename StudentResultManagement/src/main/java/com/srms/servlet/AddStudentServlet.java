package com.srms.servlet;

import com.srms.dao.StudentDAO;
import com.srms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("name");
        String dept = request.getParameter("department");
        int sem = Integer.parseInt(request.getParameter("semester"));

        Student s = new Student();
        s.setRollNo(rollNo);
        s.setName(name);
        s.setDepartment(dept);
        s.setSemester(sem);

        boolean success = studentDAO.addStudent(s);

        if (success) {
            request.setAttribute("msg", "Student added successfully!");
        } else {
            request.setAttribute("msg", "Error adding student (maybe duplicate roll number).");
        }
        request.getRequestDispatcher("add_student.jsp").forward(request, response);
    }
}
