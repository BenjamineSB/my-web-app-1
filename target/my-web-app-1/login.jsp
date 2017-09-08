<%@ page import="javax.swing.*" %>
<%--
<%@ page import="javax.swing.JFrame" %>
<%@ page import="javax.swing.JOptionPane" %>
--%>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/8/17
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    String msg;
    if("abc".equals(userName) && "123".equals(password)){

        Cookie usercookiehttp = new Cookie("user_cookie_http", userName);
        usercookiehttp.setMaxAge(60);
        usercookiehttp.setPath("localhost/my-web-app-1");
        usercookiehttp.setDomain("localhost");
        usercookiehttp.setSecure(false);//no secure flag
        response.addCookie(usercookiehttp);

        Cookie usercookiehttps = new Cookie("user_cookie_https", userName);
        usercookiehttps.setMaxAge(60);
        usercookiehttps.setPath("localhost/my-web-app-1");
        usercookiehttps.setDomain("localhost");
        usercookiehttps.setSecure(true);//no secure flag
        response.addCookie(usercookiehttps);

        response.sendRedirect("success.jsp");
    }
    else{
        response.sendRedirect("index.jsp");
        out.println("Password and Username did not match. <a href='index.jsp'>try again</a>");
    }
%>