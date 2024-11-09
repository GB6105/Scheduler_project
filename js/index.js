var checkForm = document.getElementById("loginButton");
var form = document.getElementById("loginForm");
function checkAndSubmit(){
    var idContainer = document.getElementById("inputID");
    var pwContainer = document.getElementById("inputPW");

    //유효성 검사를 위한 변수 정규표현식
    const idRegex = /^(?=.*[a-zA-Z0-9]).{2,16}$/;
    // const pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;

    //로컬 시간 받아오기
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;

    //유효성 검사

    //값이 없으면 안넘어가고
    //값입력할때마다 실시간으로 텍스트로 알려주기

    if (idContainer.value === "" ) {
        idContainer.classList.add("inputError");
        alert("아이디를 입력하세요");
    } else if(!idRegex.test(idContainer.value)){
        idContainer.classList.add("inputError");
        alert("입력하신 ID 양식이 올바르지 않습니다.")
    } else if (pwContainer.value === "") {
        pwContainer.classList.add("inputError");
        alert("비밀번호를 입력하세요");
    }else if(!pwRegex.test(pwContainer.value)){
        pwContainer.classList.add("inputError");
        alert("입력하신 PW 양식이 올바르지 않습니다.")
    }
    else{
        if(form.reportValidity()){
            //로컬 시간 데이터 넘기기
            var yearValue = document.createElement("input");
            yearValue.type = "hidden";
            yearValue.name = "year";
            yearValue.value = year;
            form.appendChild(yearValue);

            var monthValue = document.createElement("input");
            monthValue.type = "hidden";
            monthValue.name = "month";
            monthValue.value = month;
            form.appendChild(monthValue);

            //form으로 제출
            form.action = "/scheduler_project/jsp/action/account/loginAction.jsp";
            form.submit();
        }
    }
    
};
checkForm.addEventListener("click",checkAndSubmit);
form.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        event.preventDefault(); 
        checkAndSubmit();
    }
});

//회원 가입 페이지 이동
var signUpLink = document.getElementById("signUpButton");
signUpLink.addEventListener("click",function(){
    location.href='/scheduler_project/html/account/signUpPage.html'
})
//id 찾기 페이지 이동
var findIdLink = document.getElementById("findId");
findIdLink.addEventListener("click",function(){
    location.href='/scheduler_project/html/account/findIdPage.html';
})
//pw 찾기 페이지 이동
var findPwLink = document.getElementById("findPw");
findPwLink.addEventListener("click",function(){
    location.href='/scheduler_project/html/account/findPwPage.html';
})

// 입력값 없을 경우 스타일 변경
document.getElementById("inputID").addEventListener("focus",function(){
    this.classList.remove("inputError");
})

document.getElementById("inputPW").addEventListener("focus",function(){
    this.classList.remove("inputError");
})