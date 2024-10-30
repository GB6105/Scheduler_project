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

    if (idValue === "") {
        idContainer.classList.add("inputError");
        alert("아이디를 입력하세요");
    } else if (pwValue === "") {
        pwContainer.classList.add("inputError");
        alert("비밀번호를 입력하세요");
    } else if (nameValue === "") {
        nameContainer.classList.add("inputError");
        alert("이름을 입력하세요");
    }else if (deptValue === "") {
        deptContainer.classList.add("inputError");
        alert("부서를 선택하세요");
    }else if (positionValue === "") {
        positionContainer.classList.add("inputError");
        alert("직책을 선택하세요");
    }else if (emailValue === "") {
        emailContainer.classList.add("inputError");
        alert("이메일을 입력하세요");
    }else if (domailValue === "") {
        domailContainer.classList.add("inputError");
        alert("주소를 선택하세요");
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