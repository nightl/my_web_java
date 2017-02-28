package com.myweb.ltz.servlet;

import com.myweb.ltz.SqlHelper;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by we on 2017/2/20.
 */
@WebServlet("/servlet/MessageboardServlet")
public class MessageboardServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");//表单有中文
        response.setContentType("text/html;charset=UTF-8");//回复有中文
    
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
    
        String sql = "insert into messageboard values(?, ?, ?, ?)";
        int a = SqlHelper.NoneQuery(sql, name, email, title, content);
        response.sendRedirect("/content.jsp");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
    }
}
