package com.test.util.pojo;

public class Age {
    private String income;
    private  int count;
    private String age_stage;

    public String getAge_stage() {
        return age_stage;
    }

    public void setAge_stage(String age_stage) {
        this.age_stage = age_stage;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Age{" +
                "income='" + income + '\'' +
                ", count=" + count +
                ", age_stage='" + age_stage + '\'' +
                '}';
    }
}
