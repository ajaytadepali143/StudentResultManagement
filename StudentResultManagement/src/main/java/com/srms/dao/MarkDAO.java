package com.srms.dao;

import com.srms.model.ResultRow;
import com.srms.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MarkDAO {

    public boolean addOrUpdateMark(int studentId, int subjectId, int marksObtained) {
        String sql = "INSERT INTO marks (student_id, subject_id, marks_obtained) VALUES (?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE marks_obtained = VALUES(marks_obtained)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ps.setInt(2, subjectId);
            ps.setInt(3, marksObtained);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ResultRow> getResultForStudent(int studentId) {
        List<ResultRow> list = new ArrayList<>();
        String sql = "SELECT sub.name AS subject_name, sub.max_marks, m.marks_obtained " +
                     "FROM marks m " +
                     "JOIN subjects sub ON m.subject_id = sub.id " +
                     "WHERE m.student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ResultRow row = new ResultRow(
                            rs.getString("subject_name"),
                            rs.getInt("max_marks"),
                            rs.getInt("marks_obtained")
                    );
                    list.add(row);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
