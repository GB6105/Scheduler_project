function checkForm(event){
    var form = document.getElementById("inputForm");
    var idContainer = document.getElementById("inputId");
    var pwContainer = document.getElementById("inputPw");
    var nameContainer = document.getElementById("inputName");
    var deptContainer = document.getElementById("departmentSelect");
    var positionContainer = document.getElementById("positionSelect");
    var emailContainer = document.getElementById("inputEmail");
    var domailContainer = document.getElementById("domainSelect");
    
    var idValue = idContainer.value;
    var pwValue = pwContainer.value;
    var nameValue = nameContainer.value;
    var deptValue = deptContainer.value;
    var positionValue = positionContainer.value;
    var emailValue = emailContainer.value;
    var domailValue = domailContainer.value;

    const idRegex = /^(?=.*[a-zA-Z0-9]).{2,16}$/;
    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;
    const nameRegex = /^(?=.*[a-zA-Z0-9ㄱ-ㅎ가-힣]).{3,20}$/
    const emailRegex = /^(?=.*[a-zA-Z0-9]).{2,20}$/;

    if (idValue === "") {
        idContainer.classList.add("inputError");
        alert("아이디를 입력하세요");
    } else if (!idRegex.test(idValue)) {
        idContainer.classList.add("inputError");
        alert("입력하신 ID 양식이 올바르지 않습니다.");
    } else if (pwValue === "") {
        pwContainer.classList.add("inputError");
        alert("비밀번호를 입력하세요");
    } else if(!pwRegex.test(pwValue)){
        pwContainer.classList.add("inputError");
        alert("입력하신 PW 양식이 올바르지 않습니다.")
    } else if (nameValue === "") {
        nameContainer.classList.add("inputError");
        alert("이름을 입력하세요");
    }else if(!nameRegex.test(nameValue)){
        nameContainer.classList.add("inputError");
        alert("입력하신 이름 양식이 올바르지 않습니다.")
    }
    else if (deptValue === "") {
        deptContainer.classList.add("inputError");
        alert("부서를 선택하세요");
    }else if (positionValue === "") {
        positionContainer.classList.add("inputError");
        alert("직책을 선택하세요");
    }else if (emailValue === "") {
        emailContainer.classList.add("inputError");
        alert("이메일을 입력하세요");
    }else if(!emailRegex.test(emailValue)){
        emailContainer.classList.add("inputError");
        alert("입력하신 PW 양식이 올바르지 않습니다.")
    }else if (domailValue === "") {
        domailContainer.classList.add("inputError");
        alert("이메일 주소를 선택하세요");
    }else {
        if(form.reportValidity()){
            event.target.form.submit();
        }
    }
}

document.getElementById("inputId").addEventListener("focus",function(){
    this.classList.remove("inputError");
})

document.getElementById("inputPw").addEventListener("focus",function(){
    this.classList.remove("inputError");
})
document.getElementById("inputName").addEventListener("focus",function(){
    this.classList.remove("inputError");
})
document.getElementById("inputEmail").addEventListener("focus",function(){
    this.classList.remove("inputError");
})