function checkValidity(e) {
    e.preventDefault(); // 기본 폼 제출을 막습니다.
    
    var idContainer = document.getElementById("inputId");
    var pwContainer = document.getElementById("inputPw");
    var nameContainer = document.getElementById("inputName");
    var deptContainer = document.getElementById("departmentSelect");
    var positionContainer = document.getElementById("positionSelect");
    var emailContainer = document.getElementById("inputEmail");
    var domainContainer = document.getElementById("domainSelect");
    var idValue = idContainer.value;
    var pwValue = pwContainer.value;
    var nameValue = nameContainer.value;
    var deptValue = deptContainer.value;
    var positionValue = positionContainer.value;
    var emailValue = emailContainer.value;
    var domainValue = domainContainer.value;

    if (idValue === "") {
        // ID 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        idContainer.style.border = "2px solid #ff5656";
        idContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("아이디를 입력하세요");
    } else if (pwValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        pwContainer.style.border = "2px solid #ff5656";
        pwContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("비밀번호를 입력하세요");

    } else if (nameValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        nameContainer.style.border = "2px solid #ff5656";
        nameContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("이름을 입력하세요");
    }else if (deptValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        deptContainer.style.border = "2px solid #ff5656";
        deptContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("부서를 선택하세요");
    }
    else if (positionValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        positionContainer.style.border = "2px solid #ff5656";
        positionContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("직책을 선택하세요");
    }
    else if (emailValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        emailContainer.style.border = "2px solid #ff5656";
        emailContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("이메일을 입력하세요");
    }
    else if (domainValue === "") {
        // PW 값이 없을 경우, 스타일을 붉은 테두리와 붉은 배경색으로 변경
        domainContainer.style.border = "2px solid #ff5656";
        domainContainer.style.backgroundColor = "rgba(255, 0, 0, 0.1)";
        alert("도메인을 선택하세요");
    }
    
    
    
    else {
        e.target.form.submit();
    }
}
