<%--
  Created by IntelliJ IDEA.
  User: Hwang
  Date: 2021-08-23
  Time: 오후 6:26
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<body>


<div class="row" style="margin-bottom:20px; margin-left:1px;">
    <div class="col-lg-12">
        <h1 class="page-header">상세 페이지</h1>
    </div>
</div>

<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form role="form" action="/board/post" method="post">
<div class="table-responsive" style="text-align:center;">
    <div class="container">
        <table id="datatable-scroller"
               class="table table-bordered tbl_Form">
            <caption></caption>
            <colgroup>
                <col width="250px"/>
                <col/>
            </colgroup>
            <tbody>
            <tr>
                <th class="active">작성자</th>
                <td>
                    ${boardContents.id}
                </td>
            </tr>
            <tr>
                <th class="active">제목</th>
                <td>
                    ${boardContents.title}
                </td>
            </tr>
            <tr>
                <th class="active">내용</th>
                <td>
                    ${boardContents.content}
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div style="margin-left:1px;">
<a class="btn btn-primary pull-right" href="/board/list">목록</a>

        <c:choose>
             <c:when test="${sessionScope.user_info.userId == boardContents.id}">
                <a class="btn btn-warning pull-right" onclick="deleteConfirm();">삭제</a>
                <a class="btn btn-danger pull-right" href="/board/update?num=${boardContents.num}">수정</a>
             </c:when>
        </c:choose>
        </div>
        <br>
        <br>
        <br>
            </form>


        <script type="text/javascript">
        $(document).ready(function () {
        var msg = "${msg}"

        if (msg != ""){
        alert(mag);
        }
        });

        function deleteConfirm(){
        if(!confirm("삭제하시겠습니까?")){
        return false;
        }else {
        location.href="${path}/board/delete.do?num=${boardContents.num}";
        /* .do 앞에 있는 url로 매핑을 해준다(있어도되고 없어도 되지만 다른 사람이 보기 헷갈리기에 선호하지 않음) */
            }
        }
        </script>
        </body>
        </html>
