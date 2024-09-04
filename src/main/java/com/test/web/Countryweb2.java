package com.test.web;

import com.alibaba.fastjson.JSONObject;
import com.test.util.Country1;
import com.test.util.Country2;
import com.test.util.pojo.country1;
import com.test.util.pojo.country2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/j")
public class Countryweb2 extends HttpServlet {

    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<country2> lists= Country2.getCountry2();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}