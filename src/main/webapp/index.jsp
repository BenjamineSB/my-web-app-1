<!--%@ page import="javax.servlet.http.Cookie" %-->

<!--Check the session cookie is already available-->
<%
  Cookie cookie = null;
  Cookie[] cookies = null;
  cookies = request.getCookies(); //collection the cookies
    String scheme=request.getScheme();//to check [http/https]
    if("http".equals(scheme)) {
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("user_cookie_http")) {
                    response.sendRedirect("success.jsp");
                }
            }
        }
    }
    if("https".equals(scheme)){
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("user_cookie_http") || cookie.getName().equals("user_cookie_https")) {
                    response.sendRedirect("success.jsp");
                }
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
      <div class="form-checkbox">
          <%
              if("https".equals(scheme)) {
                  out.print("<input type=\"checkbox\" id=\"secure_flag\" name=\"secure_flag\" value=\"secure_flag\">\n" +
                          "        <label for=\"secure_flag\">Secure Flag</label>");
                  out.print("<input type=\"checkbox\" id=\"http_secure_flag\" name=\"http_secure_flag\" value=\"http_secure_flag\">\n" +
                          "          <label for=\"http_secure_flag\">Http Secure Flag</label>");
              }
              if("http".equals(scheme)) {
                  out.print("<input type=\"checkbox\" id=\"not_secure_flag\" name=\"not_secure_flag\" value=\"not_secure_flag\">\n" +
                          "              <label for=\"not_secure_flag\">Not Secure Flag</label>");
                  out.print("<input type=\"checkbox\" id=\"http_only_flag\" name=\"http_only_flag\" value=\"http_only_flag\">\n" +
                          "        <label for=\"http_only_flag\">Http Only Flag</label>");
              }

          %>
      </div>
      <input type="submit" name="submit" value="Login"/>

<script src="js/index.js"></script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %><% String msg="";%>
<%
  if(request.getParameter("submit") != null) {
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    String secure_flag=request.getParameter("secure_flag");
    String not_secure_flag=request.getParameter("not_secure_flag");
    String http_only_flag=request.getParameter("http_only_flag");
    String http_secure_flag=request.getParameter("http_secure_flag");

    if ("abc".equals(userName) && "123".equals(password)) {

        if("http".equals(scheme)) {
            //create usercookiehttp
            Cookie usercookiehttp = new Cookie("user_cookie_http", userName);
            usercookiehttp.setMaxAge(60 * 5);
            usercookiehttp.setPath("localhost/my-web-app-1");
            usercookiehttp.setDomain("localhost");
            usercookiehttp.setComment("not-secure");
            if (not_secure_flag != null) {
                usercookiehttp.setSecure(false);
            }

            if(http_only_flag !=null) {
                usercookiehttp.setHttpOnly(true);
            }
            response.addCookie(usercookiehttp);
            response.sendRedirect("success.jsp");
        }
        if("https".equals(scheme)) {
            if(secure_flag == null){
                msg="Secure flag check box need to check. Because of [https://]";
            }
            else {
                //create usercookiehttps
                Cookie usercookiehttps = new Cookie("user_cookie_https", userName);
                usercookiehttps.setMaxAge(60 * 5);
                usercookiehttps.setPath("localhost/my-web-app-1");
                usercookiehttps.setDomain("localhost");
                usercookiehttps.setComment("secure");
                if (secure_flag != null) {
                    usercookiehttps.setSecure(true);
                }

                if (http_secure_flag != null) {
                    usercookiehttps.setHttpOnly(true);
                }
                response.addCookie(usercookiehttps);
                response.sendRedirect("success.jsp");
            }
        }

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

