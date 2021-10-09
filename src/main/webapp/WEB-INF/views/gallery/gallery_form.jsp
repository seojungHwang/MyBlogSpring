<%--
  Created by IntelliJ IDEA.
  User: nsk76
  Date: 2021-09-21
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/gallery/new" method="post" enctype="multipart/form-data">
        <input type="file" multiple="multiple" name="files"/>
        <button>전송</button>
    </form>
</body>
</html>
