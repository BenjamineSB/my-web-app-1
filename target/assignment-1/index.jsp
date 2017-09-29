<!--%@ page import="javax.servlet.http.Cookie" %-->
<%--
  Created with IntelliJ IDEA.
  Created by Mr.S.Benjamine
  Purpose SSS - Assignment 1
  Reg. No IT15156952
  eMail benjamine.sahayanathan@my.sliit.lk
--%>
<!--Check the session cookie is already available-->
<%
  Cookie cookie = null;
  Cookie[] cookies = null;
  cookies = request.getCookies(); //collection the cookies
  if(cookies != null){
      for(int i = 0; i < cookies.length; i++){
          cookie = cookies[i];
          if (cookie.getName().equals("login_cookie")) {
              //if login_cookie found redirect to success.jsp
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
      <div class="form-checkbox">
          <input type="checkbox" id="secure_flag" name="secure_flag" value="secure_flag">
          <label for="secure_flag">Secure Flag</label>
          <input type="checkbox" id="http_only_flag" name="http_only_flag" value="http_only_flag">
          <label for="http_only_flag">Http Only Flag</label>
      </div>
      <input type="submit" name="submit" value="Login" />

<script src="js/index.js"></script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %><% String msg="";%>
<%
  if(request.getParameter("submit") != null) {
      //collect the user input and put into a variable
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    String secure_flag=request.getParameter("secure_flag");
    String http_only_flag=request.getParameter("http_only_flag");

    if ("abc".equals(userName) && "123".equals(password)) {

        //creating a cookie called logincookie name:login_cookie, value:userName+" "+password
        Cookie logincookie = new Cookie("login_cookie", userName);

        logincookie.setMaxAge(60 * 5);
        logincookie.setPath("localhost/sss/assignment-1");
        logincookie.setDomain("localhost");
        logincookie.setComment("cookie for login");
        //create secure_flag in cookie true
        if(secure_flag != null){
            logincookie.setSecure(true);
        }
        //create secure_flag in cookie false
        if(secure_flag == null){
            logincookie.setSecure(false);
        }
        //create http_only_flag in cookie true
        if(http_only_flag !=null) {
            logincookie.setHttpOnly(true);
        }
        //create http_only_flag in cookie false
        if(http_only_flag ==null) {
            logincookie.setHttpOnly(false);
        }
        response.addCookie(logincookie);
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

