<%@ page import="com.myweb.ltz.SqlHelper" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession seesion = request.getSession();
    String user = (String)seesion.getAttribute("usr");
    String name = "";
    int stdnum = 0;
    int age = 0;

    if (user == null)
    {
        user = "";
    }
    else
    {
        String sql = "select * from user where username='" + user + "'";
        SqlHelper sel = new SqlHelper();
        CachedRowSetImpl crr = sel.Select(sql);

        crr.next();
        name = crr.getString(3);
        if (name == null)
        {
            name = "";
        }
        stdnum = crr.getInt(4);
        age = crr.getInt(5);
    }
%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Hello World!</title>
  </head>
  <body>

  <h1>Hello World!
    <a href="login.jsp">登录</a>
    <%=user %>
    <%=name %>
    <%=stdnum %>
    <%=age %>
  </h1>

  <table>
      <tr>
          <th>username</th>
          <th>name</th>
          <th>age</th>
          <th>stuid</th>
      </tr>
      <% String sql = "select * from student"; %>
      <% SqlHelper sele = new SqlHelper(); %>
      <% CachedRowSetImpl crsi = sele.Select(sql); %>

      <% while(crsi.next()) { %>
      <tr>
          <td><%=crsi.getString(1) %></td>
          <td><%=crsi.getString(2) %></td>
          <td><%=crsi.getInt(3) %></td>
          <td><%=crsi.getInt(4) %></td>
      </tr>
      <% } %>
  </table>

  <form action="/servlet/UploadServlet" method="post" enctype="multipart/form-data">
      请选择上传的图片或文件:<input type="file" name="fileName"/><input type="submit" value="上传"/>
  </form>

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