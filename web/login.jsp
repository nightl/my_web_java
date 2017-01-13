<%@ page import="com.myweb.ltz.User" %><%--
  Created by IntelliJ IDEA.
  User: we
  Date: 2017/1/13
  Time: 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% HttpSession seesion = request.getSession(); %>
<% User user = (User)seesion.getAttribute("msg"); %>

<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>

<body>
<h1>登录</h1>
<form action="/LoginServlet" id="login1" method="get">
    <p>用户名：<input type="text" name="username" value="<%=user == null? "" : user.Getname() %>" /></p>
    <p>密 码：<input type="password" name="password" value="<%=user == null? "" : user.Getpassword() %>"/></p>
    <% if (user != null) { %>
    <p><%=user.Getmessage() %></p>
    <% } %>
    <p><button type="submit">提交</button></p>
</form>
</body>
</html>