<%--
  Created with IntelliJ IDEA.
  Created by Mr.S.Benjamine
  Purpose SSS - Assignment 1
  Reg. No IT15156952
  eMail benjamine.sahayanathan@my.sliit.lk
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sample content form</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<script>
    function showcookie() {
        alert(document.cookie);
    }
</script>
<body>
<div class="content-page">
    <div class="content-form">
        <p align="center">Content Page</p>
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
                        if (cookie.getName().equals("login_cookie")) {
                            //print the cookie
                            out.print("<tr><td>" + cookie.getName() + "</td>");
                            out.print("<td>" + cookie.getValue() + " </td></tr>");
                            cookie_found=true;
                        }
                    }
                    if(cookie_found){
                        out.println("<p>Cookie created successfully ... </p>");
                    }
                    else{
                        response.sendRedirect("index.jsp");
                    }
                }
                else {
                    out.println("<p>No cookies here...</p>");
                }
            %>
        </table>
        <form method="post">
            <input type="submit" name="js_btn" value="Check JS" onclick="showcookie()"/>
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
                //destroy login_cookie
                if ((cookie_destroy.getName()).compareTo("login_cookie") == 0) {
                    cookie_destroy.setMaxAge(0);
                    response.addCookie(cookie_destroy);
                    //response.sendRedirect("index.jsp");
                }
                response.setHeader("REFRESH", "0");
            }
        }
    }
%>
