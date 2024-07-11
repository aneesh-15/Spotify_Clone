<html>
<head>

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
response.setHeader("Cache-Control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); //prevents caching
String userName = (String) session.getAttribute("uname");
//out.print(userName);
session.invalidate();
request.setAttribute("uname",null);
//response.sendRedirect("index.html");
RequestDispatcher rd = request.getRequestDispatcher("index.html");
rd.forward(request, response);

%>

</body>
</html>