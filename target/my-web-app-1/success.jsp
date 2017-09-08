<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/8/17
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sample content form</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="content-page">
    <div class="content-form">
        <p align="center">Content Page</p>
        <h3>Created Cookies</h3>
        <table align="center">
            <tr>
                <th>Cookie Name</th>
                <th>Cookie Value</th>
            </tr>
            <%
                Cookie cookie = null;
                Cookie[] cookies = null;
                boolean cookie_found=false;

                // Get an array of Cookies associated with the this domain
                cookies = request.getCookies(); //collection the cookies

                if( cookies != null ) {

                    for (int i = 0; i < cookies.length; i++) {
                        cookie = cookies[i];
                        out.print("<tr><td>" + cookie.getName( ) + "</td>");
                        out.print("<td>" + cookie.getValue( )+" </td></tr>");
                        //to check the created cookie is available
                        if(cookie.getName( ).equals("user_cookie_http") || cookie.getName( ).equals("user_cookie_https")){
                            cookie_found=true;
                        }
                    }
                } else {
                    out.println("<p>No cookies founds</p>");
                }
                if(!cookie_found)
                    response.sendRedirect("index.jsp");
            %>
        </table>
        <form method="post">

            <input type="submit" name="submit" value="Logout"/>
            <script src="js/index.js"></script>
        </form>
    </div>
</div>
</body>
</html>

<%
    if(request.getParameter("submit") != null){
        Cookie cookie_destroy = null;
        Cookie[] cookie_destroy_array = null;

        // Get an array of Cookies associated with the this domain
        cookie_destroy_array = request.getCookies();

        if( cookie_destroy_array != null ) {

            for (int i = 0; i < cookie_destroy_array.length; i++) {
                cookie_destroy = cookie_destroy_array[i];

                if((cookie_destroy.getName( )).compareTo("user_cookie_http") == 0){
                    cookie_destroy.setMaxAge(0);
                    response.addCookie(cookie_destroy);
                    //response.sendRedirect("index.jsp");
                }
                if((cookie_destroy.getName( )).compareTo("user_cookie_https") == 0) {
                    cookie_destroy.setMaxAge(0);
                    response.addCookie(cookie_destroy);
                    //response.sendRedirect("index.jsp");
                }
                response.setHeader("REFRESH", "0");    // 0 for refresh without delay
            }
        }
        else {
            out.println("<p>No cookies founds</p>");
        }
    }
%>
