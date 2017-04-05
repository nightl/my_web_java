package com.myweb.ltz.servlet;

import com.myweb.ltz.SqlHelper;
import com.myweb.ltz.User;
import com.sun.rowset.CachedRowSetImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by we on 2017/1/12.
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");//表单有中文
        response.setContentType("text/html;charset=UTF-8");//回复有中文
    
        PrintWriter out = response.getWriter();
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        HttpSession seesion = request.getSession();
        seesion.setAttribute("usr", user);
        String message = "";
    
        try
        {
            User user1 = new User(user);
            int result = user1.Longin(pwd);
            
            if (result == 0)
            {
                message = "用户名不存在！";
            }
            else if (result == 1)
            {
                message = "登录成功！";
            }
            else
            {
                message = "密码错误！";
            }
            out.print(message);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }
}
