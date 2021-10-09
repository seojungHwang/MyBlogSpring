<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/gallery_list.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<header>
    <a href="#" id="logo">
        <h1>Nick Pettit</h1>
        <h2>Designer</h2>
    </a>
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/gallery/new" id="writeBtn">write</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>

<div id="wrapper">
    <section>
        <ul id="gallery">
            <c:forEach var="gallery" items="${galleryList}">
                <li>
                    <c:forEach var="i"  begin="0" end="${gallery.photoDtoList.size()-1}" step="1">
                        <c:choose>
                            <c:when test="${i==0}">
                                <a href="/images/${gallery.photoDtoList.get(i).newName}" data-toggle="lightbox" data-gallery="gallery${gallery.galleryNo}">
                                    <img src="/images/${gallery.photoDtoList.get(i).newName}" alt="">
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/images/${gallery.photoDtoList.get(i).newName}" data-toggle="lightbox" data-gallery="gallery${gallery.galleryNo}" style="display: none">
                                    <img src="/images/${gallery.photoDtoList.get(i).newName}" alt="">
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <p>${gallery.title}</p>
                </li>
            </c:forEach>
        </ul>
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('click', '#writeBtn' ,function (e){
            e.preventDefault();
            if (${sessionScope.user_info ==null}) {
                alert("로그인 후 이용해주세요")
                location.href="/";
            } else {
                location.href="/gallery/new";
            }
        });
    });

    $(document).on("click", '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
</script>
</body>
</html>