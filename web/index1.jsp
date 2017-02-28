<%@ page import="com.myweb.ltz.SqlHelper" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--HttpSession seesion = request.getSession();--%>
    <%--String user = (String)seesion.getAttribute("usr");--%>
    <%--String name = "";--%>
    <%--int stdnum = 0;--%>
    <%--int age = 0;--%>

    <%--if (user == null)--%>
    <%--{--%>
        <%--user = "";--%>
    <%--}--%>
    <%--else--%>
    <%--{--%>
        <%--String sql = "select * from user where username='" + user + "'";--%>
        <%--SqlHelper sel = new SqlHelper();--%>
        <%--CachedRowSetImpl crr = sel.Select(sql);--%>

        <%--crr.next();--%>

        <%--if (crr.getString(6).equals("普通用户"))--%>
        <%--{--%>
            <%--name = crr.getString(3);--%>
            <%--if (name == null)--%>
            <%--{--%>
                <%--name = "";--%>
            <%--}--%>
            <%--stdnum = crr.getInt(4);--%>
            <%--age = crr.getInt(5);--%>
        <%--}--%>
    <%--}--%>
<%--%>--%>


<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello World!</title>
  </head>
  <body>

  <%--<h1>Hello World!--%>
    <%--<a href="login.jsp">登录</a>--%>
    <%--<%=user %>--%>
    <%--<%=name %>--%>
    <%--<%=stdnum %>--%>
    <%--<%=age %>--%>
  <%--</h1>--%>

  <table>
      <tr>
          <th>username</th>
          <th>password</th>
          <th>gender</th>
          <th>name</th>
          <th>age</th>
          <th>stuid</th>
      </tr>
      <% HttpSession seesion = request.getSession(); %>
      <% String user = (String)seesion.getAttribute("usr"); %>
      <% String sql = "select * from student where username='" + user + "'"; %>
      <% SqlHelper sele = new SqlHelper(); %>
      <% CachedRowSetImpl crsi = sele.Select(sql); %>

      <% crsi.next(); %>
      <% if (crsi.getString(7).equals("普通用户")) { %>
      <tr>
          <td><%=crsi.getString(1) %></td>
          <td><%=crsi.getString(2) %></td>
          <td><%=crsi.getString(3) %></td>
          <td><%=crsi.getString(4) %></td>
          <td><%=crsi.getInt(5) %></td>
          <td><%=crsi.getInt(6) %></td>
      </tr>
      <% } else { %>
      <% String sql1 = "select * from student"; %>
      <% SqlHelper sele1 = new SqlHelper(); %>
      <% CachedRowSetImpl crsi1 = sele.Select(sql1); %>
      <% while(crsi1.next()) { %>
      <tr>
          <td><%=crsi1.getString(1) %></td>
          <td><%=crsi1.getString(2) %></td>
          <td><%=crsi1.getString(3) %></td>
          <td><%=crsi1.getString(4) %></td>
          <td><%=crsi1.getInt(5) %></td>
          <td><%=crsi1.getInt(6) %></td>
      </tr>
      <% } }%>
  </table>

  <form action="/servlet/UploadServlet" method="post" enctype="multipart/form-data">
      请选择上传的图片或文件:<input type="file" name="fileName"/><input type="submit" value="上传"/>
  </form>

  <input name="pclog" type="button" value="留言板" onClick="location.href='messageboard.jsp'">

  <style>
      table {
          border-collapse: collapse;
      }
      th, td {
          border: 1px solid black;
          padding: 10px;
          margin: 0px;
          text-align: center;
      }
  </style>

  </body>
</html>