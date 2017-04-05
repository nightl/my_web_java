<%@ page import="com.myweb.ltz.ErrorMessage" %>
<%--
  Created by IntelliJ IDEA.
  User: we
  Date: 2017/1/16
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<% request.setCharacterEncoding("UTF-8"); %>--%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册</title>
    <script src="ajax.js"></script>
</head>
<body>

    <table border="0" cellpadding="10px" cellspacing="0" align="center">
        <colgroup align="left">
        <tr>
            <th colspan="3">注册页面</th>
        </tr>

        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" id="username"/></td>
            <td><font color="#FF0000">*不能以数字、下划线开头</font></td>
        </tr>

        <tr>
            <td colspan="3"><font color="#FF0000"><p id="msg1"></font></td>
        </tr>

        <tr>
            <td>密 码：</td>
            <td><input type="password" name="pwd" id="pwd1"/></td>
            <td><font color="#FF0000">*数字和字母以及字符的组合</font></td>
        </tr>

        <tr>
            <tr>
                <td colspan="3"><font color="#FF0000"><p id="msg2"></font></td>
            </tr>


        <tr>
            <td>确认密码：</td>
            <td><input type="password" name="password" id="pwd2"/></td>
            <td><font color="#FF0000">*重新输入上面的密码</font></td>
        </tr>

        <tr>
            <tr>
                <td colspan="3"><font color="#FF0000"><p id="msg3"></font></td>
            </tr>
        </tr>

        <tr>
            <td>性 别：</td>
            <td>
                <select id="sex">
                    <option value="男">男</option>
                    <option value="男">女</option>
                </select>
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
            <td><input  type="text" name="relname" id="name"/></td>
            <td><font color="#FF0000">*确保输入的是真实姓名</font></td>
        </tr>

        <tr>
            <td colspan="3"><font color="#FF0000"><p id="msg4"></font></td>
        </tr>

        <tr>
            <td>年 龄：</td>
            <td><input  type="text" name="age" id="age"/></td>
            <td><font color="#FF0000">*请输入你的年龄</font></td>
        </tr>

        <tr>
            <td colspan="3"><font color="#FF0000"><p id="msg5"></font></td>
        </tr>

        <tr>
            <td>学 号：</td>
            <td><input  type="text" name="stuid" id="stuid"/></td>
            <td><font color="#FF0000">*请输入你的学号</font></td>
        </tr>

        <tr>
            <td colspan="3"><font color="#FF0000"><p id="msg6"></font></td>
        </tr>

        <tr>
            <th colspan="3">
                <input type="button"onclick="Signup()" value="提交" />
                <input type="reset" name="reset" value="重置" />
            </th>
        </tr>
        </colgroup>
    </table>

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

    <script>
        function Signup()
        {
            var usr = document.getElementById("username").value;
            var pwd1 = document.getElementById("pwd1").value;
            var pwd2 = document.getElementById("pwd2").value;
            var gender = document.getElementById("sex").value;
            var relname = document.getElementById("name").value;
            var age = parseInt(document.getElementById("age").value);
            var stuid = parseInt(document.getElementById("stuid").value);
            var url = "/servlet/RegisterServlet?username=" + usr + "&pwd1=" + pwd1 +  "&pwd2=" + pwd2 + "&sex=" + gender +
                        "&relname=" + relname + "&age=" + age + "&stuid=" + stuid;
            //url= encodeURIComponent(url);
            if (usr == "")
            {
                document.getElementById("msg1").innerHTML = "用户名不能为空！";
            }
            else if (pwd1 == "")
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "密码不能为空！";
            }
            else if (pwd2 == "")
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "";
                document.getElementById("msg3").innerHTML = "请确认密码！";
            }
            else if (pwd1 != pwd2)
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "";
                document.getElementById("msg3").innerHTML = "两次输入的密码不一致！";
            }
            else if (relname == "")
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "";
                document.getElementById("msg3").innerHTML = "";
                document.getElementById("msg4").innerHTML = "姓名不能为空！";
            }
            else if (age == "")
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "";
                document.getElementById("msg3").innerHTML = "";
                document.getElementById("msg4").innerHTML = "";
                document.getElementById("msg5").innerHTML = "年龄不能为空！";
            }
            else if (stuid == "")
            {
                document.getElementById("msg1").innerHTML = "";
                document.getElementById("msg2").innerHTML = "";
                document.getElementById("msg3").innerHTML = "";
                document.getElementById("msg4").innerHTML = "";
                document.getElementById("msg5").innerHTML = "";
                document.getElementById("msg6").innerHTML = "学号不能为空！";
            }
            else
            {
                var onSuccess = function (re)
                {
                    if (re == "用户名已存在！")
                    {
                        document.getElementById("msg1").innerHTML = re;
                    }

                    else
                    {
                        alert("注册成功！");
                    }
                };
                ajax(url, onSuccess);
            }

            /*
             var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft XMLHTTP');
             xmlhttp.open("POST", url, true);
             xmlhttp.send();

             xmlhttp.onreadystatechange = function ()
             {
             if (xmlhttp.readyState == 4)
             {
             if (xmlhttp.status == 200)
             {
             //alert(xmlhttp.responseText);
             document.getElementById("mess").innerHTML = xmlhttp.responseText;
             if (xmlhttp.responseText == "登录成功！")
             {
             //.....
             }
             }
             else
             {
             alert("Ajax return Error");
             }
             }
             };
             */
        }
    </script>
</body>
</html>
