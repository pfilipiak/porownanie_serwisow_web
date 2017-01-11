<%-- 
    Document   : sidebar
    Created on : 2016-12-14, 23:13:09
    Author     : Piotr
--%>
<jsp:include page="include.jsp"/>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidebar" class="2u">
        <section>
                <header>
                        <h2>Ustawienia</h2>
                </header>
                <div class="row">
                        <section class="10u">
                                <ul class="default">
                                        <shiro:authenticated>
                                            <li><a href="#">Konto użytkownika <shiro:user><c:out value="${account.givenName}"/></shiro:user></a></li>
                                            <li><a href="#">Klucz dostępu</a></li>
                                            <li><a href="#">Obserwowane domeny</a></li>
                                            <li><a href="#">Zdefiniowana konkurencja</a></li>
                                            <li><a href="#">Ustaw monitoring i alerty</a></li>
                                            <li><a href="<c:url value="/logout"/>">Wyloguj się</a></li>
                                        </shiro:authenticated>
                                        <shiro:notAuthenticated>
                                            <li><a href="loginPage.jsp">Zaloguj się</a></li>
                                        </shiro:notAuthenticated>
                                        
                                </ul>
                        </section>
                                                                                </div>
        </section>
        <section>
                <header>
                        <h2>Dane z monitoringu</h2>
                </header>
                <ul class="style">
                        <li>
                                <p class="posted">Grudzień 12, 2016  |  Allegro.pl</p>
                                <p><a href="#">Serwis Allegro.pl odnotował znaczny wzrost ruchu organicznego. Kliknij, aby przejść do raportu.</a></p>
                        </li>
                        <li>
                                <p class="posted">Grudzień 9, 2016  |  MediaExpert.pl</p>
                                <p><a href="#">Serwis MediaExpert.pl odnotował znaczny wzrost ruchu organicznego. Kliknij, aby przejść do raportu.</a></p>
                        </li>
                </ul>
        </section>
</div>

