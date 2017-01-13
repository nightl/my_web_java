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
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");//表单有中文
        response.setContentType("text/html;charset=UTF-8");//回复有中文
        
        PrintWriter out = response.getWriter();
        String user = request.getParameter("username");
        String pswd = request.getParameter("password");
        
        String sql = "select password from user where username='" + user + "'";
        SqlHelper sel = new SqlHelper();
        CachedRowSetImpl crr = sel.Select(sql);
        
        try
        {
            if (!crr.next())
            {
                User user1 = new User(user, pswd, "用户名不存在！");
                HttpSession seesion = request.getSession();
                seesion.setAttribute("msg", user1);
                response.sendRedirect("login.jsp");
            }
            else
            {
                String pwd = crr.getString(1);
                if (pswd.equals(pwd))
                {
                    out.print("登录成功！");
                    HttpSession seesion = request.getSession();
                    seesion.setAttribute("usr", user);
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    User user1 = new User(user, pswd, "密码错误！");
                    HttpSession seesion = request.getSession();
                    seesion.setAttribute("msg", user1);
                    response.sendRedirect("login.jsp");
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
