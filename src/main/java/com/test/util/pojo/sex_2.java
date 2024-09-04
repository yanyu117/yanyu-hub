package com.test.util.pojo;

public class sex_2 {
    private String sex;
    private int count;
    private String income;

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "sex_1{" +
                "sex='" + sex + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
