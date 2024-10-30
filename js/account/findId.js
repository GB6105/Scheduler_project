function checkForm(event){
    var form = document.getElementById("infoInputForm");

    var emailContainer = document.getElementById("inputEmail");
    var domailContainer = document.getElementById("domainSelect");
    
    var emailValue = emailContainer.value;
    var domailValue = domailContainer.value;
    if (emailValue === "") {
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


document.getElementById("inputEmail").addEventListener("focus",function(){
    this.classList.remove("inputError");
})