
<%--
  Created by IntelliJ IDEA.
  User: Hwang
  Date: 2021-08-21
  Time: 오후 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/board.css" >
</head>
<body style="text-align: center;">



<div id="main">
    <h1>게시판</h1>
</div>
<div class="search">
    <div class="searchBar">
        <select id="searchType" name="searchType">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="id">작성자</option>
        </select>
        <input type="text" id="keyword" name="keyword" value="" style="width: 300px; height: 40px; color: #0f0f0f"
               placeholder="검색어를 입력하세요"/>
        <button  id="btnSearch" name="btnSearch">검색</button>
    </div>
</div>
<div class="container">
    <!-- Table -->
    <table class="table table-striped" id="boardtable">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
        </thead>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td><c:out value="${board.num}" /></td>
                <td>
                    <a href="/board/read?num=${board.num}">
                        <c:out value="${board.title}" />
                    </a>
                </td>
                <td><c:out value="${board.content}" /></td>
                <td><c:out value="${board.id}" /></td>
                <td><c:out value="${board.board_date}" /></td>
            </tr>
        </c:forEach>
    </table>
    <hr/>
    <a class="btn btn-danger pull-right" href="/board/post">글쓰기</a>

    <div class="text-center">
        <ul class = "pagination">
            <li><a href="#">1</a> </li>
            <li><a href="#">2</a> </li>
            <li><a href="#">3</a> </li>
            <li><a href="#">4</a> </li>
            <li><a href="#">5</a> </li>
        </ul>
    </div>
</div>

<c:url var="boardList" value="/board/list"></c:url>
<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('click', '#btnSearch', function (e){
            e.preventDefault(); // 폼 태그의 전송을 막음
            var url= "${boardList}"; //{} -> EL
            url = url + "?searchType=" + $('#searchType').val(); //() -> 제이쿼리
            url = url + "&keyword=" + $('#keyword').val();
            location.href = url;
            console.log(url);
            //멍텅구리 바보 *2
        });
    });




</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
