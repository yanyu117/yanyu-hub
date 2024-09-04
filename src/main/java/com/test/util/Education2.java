package com.test.util;

import com.test.util.pojo.education_1;
import com.test.util.pojo.education_2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Education2 {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<education_2> getEducation_2() {
        List<education_2> lists= new ArrayList<>();
        Connection conn = null;
        Statement state = null;
        ResultSet resultSet = null;

        try {
            //创建连接
            conn= DriverManager.getConnection("jdbc:mysql://192.168.43.191:3306/spark?useUnicode=true&characterEncoding=utf8","root","1");
            //进行窗口对象的创建
            state=conn.createStatement();
            resultSet = state.executeQuery("select * from education_2");
            while (resultSet.next()){
                String income = resultSet.getString("income");
                int count = resultSet.getInt("count");
                String edu = resultSet.getString("education");
                education_2 edu2=new education_2();
                edu2.setIncome(income);
                edu2.setCount(count);
                edu2.setEducation(edu);
                lists.add(edu2);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (resultSet!=null){
                try {
                    resultSet.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
                resultSet = null;
            }
            if (state!=null){
                try {
                    state.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
                state = null;
            }
            if (conn!=null){
                try {
                    conn.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
                conn = null;
            }
        }

        return lists;
    }
}
