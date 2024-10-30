function checkForm(event){
    var form = document.getElementById("infoInputForm");

    var idContainer = document.getElementById("inputId");
    var emailContainer = document.getElementById("inputEmail");
    var domailContainer = document.getElementById("domainSelect");
    
    var idValue = idContainer.value;
    var emailValue = emailContainer.value;
    var domailValue = domailContainer.value;
    if (idValue ===""){
        idContainer.classList.add("inputError");
        alert("id를 입력하세요")
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
document.getElementById("inputEmail").addEventListener("focus",function(){
    this.classList.remove("inputError");
})