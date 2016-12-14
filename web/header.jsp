<%-- 
    Document   : header
    Created on : 2016-12-14, 13:44:47
    Author     : Piotr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

	<!-- Header -->
		<div id="header">
			<div id="nav-wrapper"> 
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="index.jsp">Strona główna</a></li>
                                                <li><a href="analizaSerwisu.jsp">Analiza serwisu</a></li>
                                                <li><a href="#">Serwis do serwisu</a></li>    
                                                <li><a href="#">Trendy</a></li>
                                                <li><a href="contact.jsp">Kontakt</a></li>
                                                <li><a href="loginPage.jsp">Logowanie</a></li>
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
					<h1><a href="index.jsp">Porównywarka serwisów</a></h1>
					<span class="tag">JEDYNE TAKIE NARZĘDZIE SEO NA RYNKU</span>
				</div>
			</div>
		</div>
