package com.test.web;


import com.alibaba.fastjson.JSONObject;
import com.test.util.Education1;
import com.test.util.Occupation1;
import com.test.util.Occupation2;
import com.test.util.pojo.education_1;
import com.test.util.pojo.occupation1;
import com.test.util.pojo.occupation2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/h")
public class Occupationweb2 extends HttpServlet {
    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        List<occupation2> lists= Occupation2.getOccupation2();
        resp.getWriter().write(JSONObject.toJSONString(lists));

    }
}
