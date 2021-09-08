<%--
  Created by IntelliJ IDEA.
  User: Hwang
  Date: 2021-08-21
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/board_post.css">
</head>
<body>

<h1>글쓰기</h1>
<form action="/board/post" method="post">
    <div class="half left cf">
        <input type="text" id="id" placeholder="작성자" name = "id"/>
        <input type="text" id="input-subject" placeholder="제목" name = "title"/>
    </div>
    <div class="half right cf">
        <textarea name="content" type="text" id="input-message" placeholder="내용"></textarea>
    </div>
    <input type="submit" value="Submit" id="input-submit">
</form>

</body>
</html>
