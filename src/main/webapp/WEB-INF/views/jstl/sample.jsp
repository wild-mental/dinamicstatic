<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<html>
<head>
    <title>JSTL 문법 연습</title>
</head>
<body>
<!--  HTML 주석 / 주석도 코드이기 때문에 HTML 문서에는 HTML 주석이 들어가는 것이 맞다 -->
<%--  JSP 주석  / JSP 는 코드가 아니냐? 코드 맞음.
                 JSP 는 HTML을 만들어 주기 위해서 존재하는 언어,
                 HTML 문서가 만들어질 때에 (템플릿 엔진에 의해 ) 소비되고 사라짐  --%>
<h1>1. JSP 기본 문법</h1>
<%!
    int a = 10;
    int b = 20;
%>
<%
    int a = 10;
    int b = 20;
    int c = a + b;
%>
<%= a + " + " + b + " = " + c %>
<br><hr><br>
<h1>2. JSTL Core 태그 사용</h1>
<h2>1) 변수 선언 및 반복문</h2>
<c:set var="numbers" value="${[1, 2, 3, 4, 5]}" />
<ul>
    <c:forEach var="number" items="${numbers}">
        <li>Number: <c:out value="${number}" /></li>
    </c:forEach>
</ul>
<h2>2) 조건 확인 및 함수 호출</h2>
<c:set var="messageLength" value="${fn:length(message)}" />
<c:out value="${messageLength}" />
<c:set var="isLongMsg" value="${messageLength ge 10}" />
<c:if test="${isLongMsg}">
    <p>Message is long!</p>
    <c:out value="Message content : ${message}"/>
</c:if>
<br><hr><br>
<h1>3. JSTL FMT 태그 사용</h1>
<%--  now 컨텍스트 변수를 포매팅 적용  --%>
<h2>1) 현재 시각에 포매팅을 적용해 출력</h2>
<fmt:formatDate value="${now}" var="currentTime" pattern="yyyy-MM-dd HH:mm:ss" />
<c:out value="formatted datetime : ${currentTime}"/>
<h2>2) 숫자 및 통화 formatting</h2>
<fmt:formatNumber var="formattedNumber" value="${123456.789}" type="number" pattern="#,##0.00" />
<p>Formatted Number: <c:out value="${formattedNumber}" /></p>
<fmt:formatNumber var="formattedNumber2" value="${76543210.012345}" type="number" pattern="#,##0.00" />
<p>Formatted Number: <c:out value="${formattedNumber2}" /></p>
<fmt:formatNumber var="formattedCurrency" value="${123456.789}" type="currency" currencyCode="USD" />
<p>Formatted Currency: <c:out value="${formattedCurrency}" /></p>
<br><hr><br>
<h1>4. SQL 태그 사용</h1>
<h2>PokeDex 데이터 출력해보기</h2>
<%--1. 데이터베이스 접속--%>
<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://mysql_poke.docker:12345/pokemon_game" user="root" password="12341234" />
<%--2. 쿼리문 실행 및 데이터 조회--%>
<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM poke_dex LIMIT 10;
</sql:query>
<%--3. 읽어온 데이터를 적절히 화면에 표시--%>
<c:forEach var="row" items="${result.rows}">
    <p>Monster ID: <c:out value="${row.monster_id}" />, Monster Name: <c:out value="${row.monster_name}" /></p>
</c:forEach>
</body>
</html>