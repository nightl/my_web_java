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
<form action="/LoginServlet" id="login" method="post">
    <p>用户名：<input type="text" name="username"/></p>
    <p>密 码： <input type="password" name="password"/></p>
    <% if (user != null) { %>
    <p><%=user.Getmessage() %></p>
    <% } %>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">登录</button> &nbsp;<input name="pclog" type="button" value="注册用户" onClick="location.href='register.jsp'"></p>
</form>
</body>
</html>