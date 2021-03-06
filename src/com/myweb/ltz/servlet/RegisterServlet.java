package com.myweb.ltz.servlet;

import com.myweb.ltz.ErrorMessage;
import com.myweb.ltz.SqlHelper;
import com.myweb.ltz.User;
import com.sun.rowset.CachedRowSetImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by we on 2017/1/17.
 */
@WebServlet("/servlet/RegisterServlet")
public class RegisterServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");//表单有中文
        response.setContentType("text/html;charset=UTF-8");//回复有中文
    
        PrintWriter out = response.getWriter();
        String user = request.getParameter("username");
        String pwd1 = request.getParameter("pwd1");
        String pwd2 = request.getParameter("pwd2");
        String gender = request.getParameter("sex");
        String name = request.getParameter("relname");
        int age = Integer.parseInt(request.getParameter("age"));
        int stuid = Integer.parseInt(request.getParameter("stuid"));
        String message = "";
        
        try
        {
            User user1 = new User(user);
            int result = user1.SignUp(pwd1, pwd2, gender, name, age, stuid);
            
            if (result == 2)
            {
                message = "用户名已存在！";
            }
            else
            {
                message = "注册成功！";
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
