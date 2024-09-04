package com.test.util;

import com.test.util.pojo.occupation1;
import com.test.util.pojo.occupation2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Occupation2 {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<occupation2> getOccupation2() {
        List<occupation2> lists= new ArrayList<>();
        Connection conn = null;
        Statement state = null;
        ResultSet resultSet = null;

        try {
            //创建连接
            conn= DriverManager.getConnection("jdbc:mysql://192.168.43.191:3306/spark?useUnicode=true&characterEncoding=utf8","root","1");
            //进行窗口对象的创建
            state=conn.createStatement();
            resultSet = state.executeQuery("select * from occupation_2");
            while (resultSet.next()){
                String income = resultSet.getString("income");
                int count = resultSet.getInt("count");
                String occ = resultSet.getString("occupation");
                occupation2 occ2 =new occupation2();
                occ2.setIncome(income);
                occ2.setCount(count);
                occ2.setOccupation(occ);
                lists.add(occ2);

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
