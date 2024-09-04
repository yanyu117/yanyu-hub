package com.test.util.pojo;

public class race1 {
    private String race;
    private int count;
    private String income;

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
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
        return "race1{" +
                "race='" + race + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
