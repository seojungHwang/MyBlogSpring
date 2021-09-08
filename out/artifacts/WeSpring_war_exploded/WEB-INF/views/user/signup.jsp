<%--
  Created by IntelliJ IDEA.
  User: Hwang
  Date: 2021-08-15
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/signup.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<h2>Weekly Coding Challenge #1: Sign in/up Form</h2>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="/signup/new" method="post" id="sinh_up_form"> <%-- form 쓰기 할떄 씀, 회원가입 , 글쓰기 등  --%>
            <h1>Create Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="id" placeholder="아이디를 입력하세요" id="user_id" name = "userId"/>
            <input type="password" placeholder="비밀번호를 입력하세요" id="user_pass" name="userPass"/>
            <input type="text" placeholder="이름을 입력하세요" id="user_name" name = "userName"/>

            <div>
                <input type="radio" id="man" name="gender" value="남">남
                <input type="radio" id="woman" name="gender" value="여">여
            </div>
        <%-- type: 버튼타입을 "button"으로 주지 않으면 클릭시 바로 back단으로 넘어가 버림/
        유효성을 검사 할 수 없음
        프론트로 연결하기 위함(검사 위해)
         자바에서 쓰는 자원의 양보다 프로트에서 쓰는 자원의 양이 더 효율적임(그래서 유효성 검사)
         --%>
            <button type="button" id="sing_btn">Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/signin/new" method="post" id="sinh_in_form">
            <h1>Sign in</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="text" placeholder="아이디를 입력하세요" id="user_id2" name = "userId"/>
            <input type="password" placeholder="비밀번호를 입력하세요" id="user_pass2" name = "userPass"/>
            <a href="#">Forgot your password?</a>
            <button type="button" id="sign_in_btn">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>
        Created with <i class="fa fa-heart"></i> by
        <a target="_blank" href="https://florin-pop.com">Florin Pop</a>
        - Read how I created this and how you can join the challenge
        <a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
    </p>
</footer>
<script type="text/javascript">
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
/* validation (유효성 검사)  제이쿼리*/
    $("#sing_btn").on('click', function (){
       let user_id = $("#user_id").val();
       let user_pass = $("#user_pass").val();
       let user_name = $("#user_name").val();

       if (user_id=="") {
           alert("id를 입력해주세요");
           return;
       }else if (user_pass ==""){
           alert("비밀번호를 입력해주세요");
           return;
       }else if (user_name == ""){
           alert("이름을 입력해주세요");
           return;
       }
       if(confirm("가입하시겠습니까?")){
           $("#sinh_up_form").submit();
        }
    });
    // function checkInputs() {
    //     const idCheck = user_id.value().trim();
    //     const passCheck = user_pass.value().trim();
    // }
/*제이쿼리*/
    $("#sign_in_btn").on('click', function (){
        let user_id = $("#user_id2").val();
        let user_pass = $("#user_pass2").val();

        if (user_id=="") {
            alert("id를 입력해주세요");
            return;
        }else if (user_pass =="") {
            alert("비밀번호를 입력해주세요");
            return;
        }


        $.ajax({
            type: 'POST',
            url: "/signin/new",
            data: {"userId" : user_id, "userPass" : user_pass},
            success: function (result){
                if (result=='ok'){
                    window.location.href="/";
                }else {
                    alert("입력하신 정보로 조회되는 회원이 없습니다");
                }
            },
            error: function (error){
                console.log("ERROR : ", error);
            }
        });

    });

</script>
</body>

</html>
