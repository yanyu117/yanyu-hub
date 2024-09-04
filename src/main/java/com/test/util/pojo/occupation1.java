package com.test.util.pojo;

public class occupation1 {
    private String occupation;
    private int count;
    private String income;

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    @Override
    public String toString() {
        return "occupation1{" +
                "occupation='" + occupation + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
