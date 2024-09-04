package com.test.util.pojo;

public class country2 {
    private  String country;
    private int count;
    private String income;

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
        return "country1{" +
                "country='" + country + '\'' +
                ", count=" + count +
                ", income='" + income + '\'' +
                '}';
    }
}
