package com.test.web;

import com.alibaba.fastjson.JSONObject;
import com.test.util.Hours1;
import com.test.util.Hours2;
import com.test.util.pojo.hours;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/n")
public class Hoursweb2 extends HttpServlet {

    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<hours> lists= Hours2.getHours2();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}
