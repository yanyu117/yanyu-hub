package com.test.web;

import com.alibaba.fastjson.JSONObject;
import com.test.util.Hours1;
import com.test.util.Race2;
import com.test.util.pojo.hours;
import com.test.util.pojo.race1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/m")
public class Hoursweb1 extends HttpServlet {

    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<hours> lists= Hours1.getHours1();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}