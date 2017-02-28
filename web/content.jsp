<%--
  Created by IntelliJ IDEA.
  User: we
  Date: 2017/2/26
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.myweb.ltz.SqlHelper" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>显示所有留言</title>
</head>

<body>
<p align="center">所有留言</p>

    <% String sql = "select * from messageboard"; %>
    <% CachedRowSetImpl crr = SqlHelper.Query(sql); %>
    <% while(crr.next()) { %>
<table  align="center" width="80%" border=1 >
    <tr>
        <td width="20%">留言人:</td>
        <td width="23%"><%=crr.getString(1)%></td>
        <td width="58%" align="center"><% out.println("邮箱：<a href=mailto:"+crr.getString(2)+">"+crr.getString(2)+"</a>"); %></td>
    </tr>
    <tr>
        <td width="20%">主题:</td>
        <td width="23%"><%=crr.getString(3)%></td>
        <td width="58%" align="center"></td>
    </tr>
    <tr>
        <td width="20%">内容:</td>
        <td colspan="2"> <%=crr.getString(4)%> </td>
    </tr>
</table>
    <% } %>
<style>
    table {
        border-collapse: collapse;
        align-content: center;
    }
    th, td {
        border: 0px solid black;
        padding: 10px;
        margin: 0px;
        /*text-align: center;*/
    }
</style>

</body>
</html>
