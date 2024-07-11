<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<body>
<%

String username=request.getParameter("user");
String pass=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select  * from users1");
int flag=0;

while(rs.next())
{

if(rs.getString(4).equals(username) && rs.getString(5).equals(pass))
{
flag=1;
break;
}
} 
if (flag==0)  
{
out.print(" Username or Password not correct"+"<br/>");
out.print("<a href='index.html'><p>Back to Login</p></a>");
}
else
{
out.print("Login Successful"+"<br>");
session.setAttribute("username",username);
session.setMaxInactiveInterval(30);
response.sendRedirect("/Spotify-project/index2.html");

}

%>

</body>
</html>