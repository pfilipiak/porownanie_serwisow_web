<%-- 
    Document   : header
    Created on : 2016-12-14, 13:44:47
    Author     : Piotr
--%>
<jsp:include page="include.jsp"/>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

	<!-- Header -->
		<div id="header">
			<div id="nav-wrapper"> 
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="./index.jsp">Strona główna</a></li>
                                                <li><a href="./analizaSerwisu.jsp">Analiza serwisu</a></li>
                                         <!--   <li><a href="./serviceToService.jsp">Serwis do serwisu</a></li>    -->
                                                <li><a href="./analizaTrendow.jsp">Trendy</a></li>
                                                <li><a href="./contact.jsp">Kontakt</a></li>
                                                <shiro:authenticated>
                                                    <li><a href="./account/"><shiro:user>
        <%
            request.setAttribute("account", org.apache.shiro.SecurityUtils.getSubject().getPrincipals().oneByType(java.util.Map.class));
        %>
        Witaj, <c:out value="${account.givenName}"/></shiro:user>!</a></li>
                                                    <li><a href="<c:url value="/logout"/>">Wyloguj się</a></li>
                                                
                                                </shiro:authenticated>
                                                <shiro:notAuthenticated><li><a href="./loginPage.jsp">Logowanie</a></li></shiro:notAuthenticated>
                                            
                                                <li>
                                                    <form action="Reports?r=1" method="get">
                                                        <input type="hidden" name="r" value="basic">
                                                        <input type="text" name="website" placeholder=" Analizuj domenę..." value="">
                                                    </form>
                                                </li>
					</ul>
				</nav>
			</div>
			<div class="container"> 
				
				<!-- Logo -->
				<div id="logo">
					<h1><a href="./index.jsp">Porównywarka serwisów</a></h1>
					<span class="tag">JEDYNE TAKIE NARZĘDZIE SEO NA RYNKU</span>
				</div>
			</div>
		</div>
