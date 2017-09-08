<!--Check the session cookie is already available-->
<%
  Cookie cookie = null;
  Cookie[] cookies = null;
  cookies = request.getCookies(); //collection the cookies
  if( cookies != null ) {

    for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      if(cookie.getName( ).equals("user_cookie_http") || cookie.getName( ).equals("user_cookie_https")){
        response.sendRedirect("success.jsp");
      }
    }
  }
%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Sample login form</title>
  <link rel="stylesheet" href="css/style.css">
</head>

<body>
 <div class="login-page">
  <div class="form">
    <p>Login Form</p>
    <form method="post" class="login-form">
      <input type="text" name="username" placeholder="username"/>
      <input type="password" name="password" placeholder="password"/>
      <input type="submit" name="submit" value="Login"/>

<script src="js/index.js"></script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %><% String msg="";%>
<%
  if(request.getParameter("submit") != null) {
    String userName = request.getParameter("username");
    String password = request.getParameter("password");

    if ("abc".equals(userName) && "123".equals(password)) {

      Cookie usercookiehttp = new Cookie("user_cookie_http", userName);
      usercookiehttp.setMaxAge(60*5);
      usercookiehttp.setPath("localhost/my-web-app-1");
      usercookiehttp.setDomain("localhost");
      usercookiehttp.setSecure(false);//no secure flag
      response.addCookie(usercookiehttp);

      Cookie usercookiehttps = new Cookie("user_cookie_https", userName);
      usercookiehttps.setMaxAge(60*5);
      usercookiehttps.setPath("localhost/my-web-app-1");
      usercookiehttps.setDomain("localhost");
      usercookiehttps.setSecure(true);//no secure flag
      response.addCookie(usercookiehttps);

      response.sendRedirect("success.jsp");
    }
    else {
      msg="Error in Login!!!";
      //response.sendRedirect("index.jsp");
    }
  }
%>
      <p><%out.println(msg); %></p>
    </form>
  </div>
 </div>
</body>
</html>

