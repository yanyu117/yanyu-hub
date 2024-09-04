package com.test.util.pojo;

public class education_1 {
    private String education;
    private int count;
    private  String income;

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "education_1{" +
                "education='" + education + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
