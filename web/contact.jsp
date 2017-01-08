<%-- 
    Document   : contact
    Created on : 2016-12-14, 19:33:13
    Author     : Piotr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>Porównywarka serwisów</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="najlepsze narzędzie dla specjalistów SEO na rynku" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
                <script src="js/contact.js"></script>
                
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
        </head>
	<body>

	<!-- Header -->
        <%@include file="header.jsp" %>
        <!-- /Header --> 

	<!-- Main -->
		<div id="main">
			<div id="content" class="container">
				<section>
					<header>
						<h2>Chcesz wiedzieć więcej?</h2>
						<span class="byline">Napisz do nas</span>
					</header>
                                        <section class="10u">
                                        <div id="contact_panel">
                                            <FORM NAME="mailer" METHOD="post" ACTION="" ENCTYPE="text/plain" onSubmit="(document.mailer.action += mailtoandsubject)"> 
                                            <TABLE BORDER="0">
                                            <TR VALIGN="top">
                                            <TD>Odbiorca:</TD>
                                            <TD>
                                            <SELECT NAME="mailtoperson" onChange="msg(this.form)">
                                            <OPTION VALUE="">Wybierz odbiorcę ...
                                            <OPTION VALUE="biuro@porownywarkaserwisow.pl">Biuro Obsługi Klienta
                                            <OPTION VALUE="biuro@porownywarkaserwisow.pl">Reklama
                                            <OPTION VALUE="webmaster@porownywarkaserwisow.pl">Obsługa techniczna
                                                

                                            </SELECT>
                                            </TD>
                                            </TR>
                                            <TR VALIGN="top">
                                            <TD>Twoje nazwisko:</TD>
                                            <TD>
                                            <INPUT TYPE="text" SIZE="45" NAME="name" onChange="msg(this.form)">
                                            </TD>
                                            </TR>
                                            <TR VALIGN="top">
                                            <TD>Twój adres email:</TD>
                                            <TD>
                                            <INPUT TYPE="text" SIZE="45" NAME="email" onChange="msg(this.form)">
                                            </TD>
                                            </TR>
                                            <TR VALIGN="top">
                                            <TD>Ważność:</TD>
                                            <TD>
                                            <SELECT NAME="priority" onChange="msg(this.form)">
                                            <OPTION VALUE="Normal">Zwykły
                                            <OPTION VALUE="Urgent">Pilny
                                            <OPTION VALUE="No Reply Needed">Nie potrzeba odpowiadać
                                            </SELECT></TD>
                                            </TR>
                                            <TR VALIGN="top">
                                            <TD>temat:</TD>
                                            <TD><INPUT TYPE="text" SIZE="45" NAME="subject" onChange="msg(this.form)"></TD>
                                            </TR>
                                            <TR VALIGN="top">
                                            <TD>Wiadomość:</TD>
                                            <TD>
                                            <TEXTAREA NAME="message" COLS="45" ROWS="7" OnChange="msg(this.form)">
                                            </TEXTAREA>
                                            </TD>
                                            </TR>
                                            <TR>
                                            <TD> </TD>
                                            <TD><INPUT TYPE="submit" VALUE="Wyślij">
                                            <INPUT TYPE="reset" VALUE="Reset"></TD>
                                            </TR>
                                            </TABLE>
                                            </FORM>
                                    </section>
				</section>
			</div>
		</div>
	<!-- /Main -->

        <%@include file="footer.jsp" %>

	</body>
</html>