package com.test.util;

import com.test.util.pojo.hours;
import com.test.util.pojo.race1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Hours1 {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<hours> getHours1() {
        List<hours> lists= new ArrayList<>();
        Connection conn = null;
        Statement state = null;
        ResultSet resultSet = null;

        try {
            //创建连接
            conn= DriverManager.getConnection("jdbc:mysql://192.168.43.191:3306/spark?useUnicode=true&characterEncoding=utf8","root","1");
            //进行窗口对象的创建
            state=conn.createStatement();
            resultSet = state.executeQuery("select * from hours_1");
            while (resultSet.next()){
                String income = resultSet.getString("income");
                int count = resultSet.getInt("count");
                String hs = resultSet.getString("hours_stage");
                hours hs1= new hours();
                hs1.setIncome(income);
                hs1.setCount(count);
                hs1.setHours_stages(hs);
                lists.add(hs1);

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
