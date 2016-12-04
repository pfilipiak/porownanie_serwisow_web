<%-- 
    Document   : index
    Created on : 2016-12-02, 03:55:08
    Author     : Adrian
    SERVER     : GlassFsh 4.1.1.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <br>
        <form action="DemoServlet" method="get">
            Live: <input type="text" name="website" value="ceneo.pl">
            <input type="submit" value="check">
        </form>
        <br>Historycznie:
        <a href="./DemoServlet?website=redcoon.pl&date=201610">Redcoon X 2016</a>
        <br>lub<br>
        <a href="./DemoServlet?r=1&website=pwr.wroc.pl&date=201610">demo z raport 1</a>
    </body>
</htmle
