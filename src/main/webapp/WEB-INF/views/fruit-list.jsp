<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>과일 목록 페이지</title>
</head>
<body>
<h1>Fruit List</h1>
<ul>
    <%--  model Attribute = JSP 파일에서 참조할 수 있는 변수(속성)  --%>
    <c:forEach var="fruit" items="${fruits}">
        <li>${fruit}</li>
    </c:forEach>
</ul>
</body>
</html>