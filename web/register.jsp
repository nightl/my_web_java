<%@ page import="com.myweb.ltz.ErrorMessage" %>
<%--
  Created by IntelliJ IDEA.
  User: we
  Date: 2017/1/16
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% HttpSession seesion = request.getSession(); %>
<% ErrorMessage error = (ErrorMessage)seesion.getAttribute("msg"); %>

<html>
<head>
    <title>注册</title>
</head>
<body>
    <form action="/servlet/RegisterServlet" method="post">
        <table border="0" cellpadding="10px" cellspacing="0" align="center">
            <colgroup align="left">
            <tr>
                <th colspan="3">注册页面</th>
            </tr>

            <tr>
                <td>用户名：</td>
                <td><input type="text" name="username"/></td>
                <td><font color="#FF0000">*不能以数字、下划线开头</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>
                    <font color="#FF0000">
                        <% if (error != null) { %>
                        <p><%=error.GetError1() %></p>
                        <% } %>
                    </font>
                </td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>密 码：</td>
                <td><input type="password" name="pwd" /></td>
                <td><font color="#FF0000">*数字和字母以及字符的组合</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>确认密码：</td>
                <td><input type="password" name="password" /></td>
                <td><font color="#FF0000">*重新输入上面的密码</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td><font color="#FF0000"><%=error == null? "" : error.GetError2()%></font></td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>性 别：</td>
                <td>
                    <input type="radio" name="sex" value="男" checked="checked"/>男
                    <input type="radio" name="sex" value="女"/>女
                </td>
                <td><font color="#FF0000">*要慎重选择</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>真实姓名：</td>
                <td><input  type="text" name="relname"/></td>
                <td><font color="#FF0000">*确保输入的是真实姓名</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>年 龄：</td>
                <td><input  type="text" name="age"/></td>
                <td><font color="#FF0000">*请输入你的年龄</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>学 号：</td>
                <td><input  type="text" name="stuid"/></td>
                <td><font color="#FF0000">*请输入你的学号</font></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <th colspan="3">
                    <input type="submit" name="submit" value="提交" />
                    <input type="reset" name="reset" value="重置" />
                </th>
            </tr>
        </table>
    </form>
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
