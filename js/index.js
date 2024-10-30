function checkForm(event){
    var form = document.getElementById("loginForm");
    var idContainer = document.getElementById("inputID");
    var pwContainer = document.getElementById("inputPW");
    var idValue = idContainer.value;
    var pwValue = pwContainer.value;

    if (idValue === "") {
        idContainer.classList.add("inputError");
        alert("아이디를 입력하세요");
    } else if (pwValue === "") {
        pwContainer.classList.add("inputError");
        alert("비밀번호를 입력하세요");
    } else {
        if(form.reportValidity()){
            event.target.form.submit();
        }
    }
}

document.getElementById("inputID").addEventListener("focus",function(){
    this.classList.remove("inputError");
})

document.getElementById("inputPW").addEventListener("focus",function(){
    this.classList.remove("inputError");
})