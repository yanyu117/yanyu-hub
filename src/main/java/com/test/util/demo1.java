package com.test.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class demo1 {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<Student> getStudent() {
        List<Student> lists= new ArrayList<>();
        Connection conn = null;
        Statement state = null;
        ResultSet resultSet = null;

        try {
            //创建连接
             conn=DriverManager.getConnection("jdbc:mysql://192.168.43.191:3306/hive?useUnicode=true&characterEncoding=utf8","root","1");
            //进行窗口对象的创建
             state=conn.createStatement();
             resultSet = state.executeQuery("select * from go");
            while (resultSet.next()){
                String name= resultSet.getString("name");
                int id = resultSet.getInt("id");
                Student st =new Student();
                st.setName(name);
                st.setId(id);
                lists.add(st);
                System.out.println(st);

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

