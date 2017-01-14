<%--
  ~ Copyright (c) 2013 Les Hazlewood and contributors
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<jsp:include page="../include.jsp"/>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apache Shiro Tutorial Webapp : Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Add some nice styling and functionality.  We'll just use Twitter Bootstrap -->
    <style>
        body{padding: 0 20px;}
    </style>
</head>
<body>

    <h2>For authenticated users only!</h2>

    <p>This page simulates a restricted part of a web application intended for authenticated users only.</p>

    <p>You are currently logged in.</p>

    <p><a href="<c:url value="/index.jsp"/>">Return to the home page.</a></p>

    <p><a href="<c:url value="/logout"/>">Log out.</a></p>


</body>
</html>