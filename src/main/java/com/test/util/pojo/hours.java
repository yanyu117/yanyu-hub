package com.test.util.pojo;

public class hours {
    private String hours_stages;
    private int count;
    private String income;

    public String getHours_stages() {
        return hours_stages;
    }

    public void setHours_stages(String hours_stages) {
        this.hours_stages = hours_stages;
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
        return "hours{" +
                "hours_stages='" + hours_stages + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
