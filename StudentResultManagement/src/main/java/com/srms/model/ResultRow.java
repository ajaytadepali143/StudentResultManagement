package com.srms.model;

public class ResultRow {
    private String subjectName;
    private int maxMarks;
    private int marksObtained;

    public ResultRow() {}

    public ResultRow(String subjectName, int maxMarks, int marksObtained) {
        this.subjectName = subjectName;
        this.maxMarks = maxMarks;
        this.marksObtained = marksObtained;
    }

    public String getSubjectName() {
        return subjectName;
    }
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getMaxMarks() {
        return maxMarks;
    }
    public void setMaxMarks(int maxMarks) {
        this.maxMarks = maxMarks;
    }

    public int getMarksObtained() {
        return marksObtained;
    }
    public void setMarksObtained(int marksObtained) {
        this.marksObtained = marksObtained;
    }
}
