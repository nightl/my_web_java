<%--
  Created by IntelliJ IDEA.
  User: we
  Date: 2017/2/20
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>

<head>
	<title> message board </title>
</head>

<body>
	<center>留言板</center>
	<form action="/servlet/MessageboardServlet" method="post">
 		<table  border=0 align="center">
 			<tr>
	 			<td>姓名：</td>
	 			<td><input type="text" name="name" size=25>  </td>
 			</tr>
 			<tr>
 				<td>E-mail：</td>
    			<td><input type="text" name="email" size=25></td>
    		</tr>
 			<tr>
 				<td>主题：</td>
    			<td><input type="text" name="title" size=25></td>
    		</tr>
   			<tr>
   				<td>留言：</td>
    			<td><textarea name="content" rows=7 cols=27></textarea></td>
    		</tr>
   			<tr>
   				<td colspan=2>
					<table align="center" width="100%" cellspacing="0" cellpadding="0" >
		   				<tr>
		     				<td align="center">
		     					<input type="submit" value="提交留言">
		     				</td>
		   					<td align="center">
		    				<a href="content.jsp"><font size=2>查看留言</font></a></td>
		   					<td align="center">
		   						<input type="reset" value="重新填写">
		   					</td>
		   				</tr>
	   				</table>
	   			</td>
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

