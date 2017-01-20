package com.myweb.ltz.servlet;

import com.myweb.ltz.ErrorMessage;
import com.myweb.ltz.SqlHelper;
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
        doGet(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");//表单有中文
        response.setContentType("text/html;charset=UTF-8");//回复有中文
    
        PrintWriter out = response.getWriter();
        String user = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        String pswd = request.getParameter("password");
        String gender = request.getParameter("sex");
        String name = request.getParameter("relname");
        String age = request.getParameter("age");
        String stuid = request.getParameter("stuid");
    
        String sql = "select password from student where username='" + user + "'";
        SqlHelper sel = new SqlHelper();
        CachedRowSetImpl crr = sel.Select(sql);
        try
        {
            if (crr.next())
            {
                ErrorMessage error1 = new ErrorMessage("用户名已存在！"," ");
                HttpSession seesion = request.getSession();
                seesion.setAttribute("msg", error1);
                response.sendRedirect("/register.jsp");
            }
            else
            {
                if (!pwd.equals(pswd))
                {
                    ErrorMessage error1 = new ErrorMessage(" ","两次输入的密码不一致！");
                    HttpSession seesion = request.getSession();
                    seesion.setAttribute("msg", error1);
                    response.sendRedirect("/register.jsp");
                }
                else
                {
                    String sql1 = "insert into student values('" + user +"'," + "'" + pswd + "'," + "'" + gender + "'," + "'" + name + "'," + "'" + age + "'," + "'" + stuid + "'," + "'普通用户')";
                    SqlHelper ins = new SqlHelper();
                    ins.Add(sql1);
                    response.sendRedirect("/index.jsp");
                }
            }
        
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
