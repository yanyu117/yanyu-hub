package com.test.web;

import com.alibaba.fastjson.JSONObject;
import com.test.util.Race1;
import com.test.util.Race2;
import com.test.util.pojo.race1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/l")
public class Raceweb2 extends HttpServlet {

    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<race1> lists= Race2.getrace2();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}