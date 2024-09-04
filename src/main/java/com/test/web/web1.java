package com.test.web;


import com.alibaba.fastjson.JSONObject;
import com.test.util.Student;
import com.test.util.demo1;
import netscape.javascript.JSObject;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/a")
public class web1 extends HttpServlet {
    @Override
    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<Student> lists= demo1.getStudent();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}

