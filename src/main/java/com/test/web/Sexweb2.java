package com.test.web;

import com.alibaba.fastjson.JSONObject;
import com.test.util.Agecharts;
import com.test.util.Sexcharts1;
import com.test.util.Sexcharts2;
import com.test.util.pojo.Age;
import com.test.util.pojo.sex_1;
import com.test.util.pojo.sex_2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/d")
public class Sexweb2 extends HttpServlet {

    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<sex_2> lists= Sexcharts2.getSex_2();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}
