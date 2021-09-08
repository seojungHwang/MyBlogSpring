<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hwang
  Date: 2021-08-22
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="/resources/css/home.css">
    <title>Title</title>

</head>
<body>
<c:choose> <%-- 문법의 하나로써 swich case 할려고 이렇게 써야됨 / jsp 라이브러리 --%>
  <c:when test="${sessionScope.user_info != null}"><%--  if --%>
    <h3>${sessionScope.user_info.userName} 님</h3>
  </c:when>  <%--  if --%>
  <c:otherwise><%-- else --%>
    <h3>Test</h3>
  </c:otherwise> <%-- else --%>
</c:choose>

<ul>  <%-- 목록을 나타내는 html (li, a랑 셋뚜셋뚜라고 보면됨--%>
  <li><a href="/signup/new" data-content="Sing up">Sing up</a></li>
  <li><a href="/board/list" data-content="Board">Board</a></li>
  <li><a href="/tag" data-content="About">About</a></li>
  <li><a href="#" data-content="Blog">Blog</a></li>
</ul>


</body>
</html>
