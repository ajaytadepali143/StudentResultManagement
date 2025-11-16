package com.srms.model;

public class Mark {
    private int id;
    private int studentId;
    private int subjectId;
    private int marksObtained;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getSubjectId() {
        return subjectId;
    }
    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public int getMarksObtained() {
        return marksObtained;
    }
    public void setMarksObtained(int marksObtained) {
        this.marksObtained = marksObtained;
    }
}
