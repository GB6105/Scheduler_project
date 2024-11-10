function focusIn(idx){
    var option = document.getElementById("optionContainer_"+idx);
    option.style.display = "flex";
}

function foucusOut(idx){
    var option = document.getElementById("optionContainer_"+idx);
    option.style.display = "none";
}

function addTodo(fullDateValue){
    var timeContainer = document.getElementById("inputTime");
    var timeValue = timeContainer.value;
    var contentContainer = document.getElementById("inputTodo");
    var contentValue = contentContainer.value;   
    
    const timeRegex = /^(?:[01]\d|2[0-3]):[0-5]\d$/;
    const contentRegex = /^[a-zA-Z0-9가-힣]{2,40}$/;


    if (timeValue === "") {
        timeContainer.classList.add("inputError");
        alert("시간을 입력하세요");
    } else if (!timeRegex.test(timeValue)) {
        timeContainer.classList.add("inputError");
        alert("입력하신 ID 양식이 올바르지 않습니다.");
    }else if(contentValue ===""){
        contentContainer.classList.add("inputError");
        alert("값을 입력하세요");
    }else if(!contentRegex.test(contentValue)){
        contentContainer.classList.add("inputError");
        alert("입력하신 일정 양식이 올바르지 않습니다.");        
    }else{
        location.href = "/scheduler_project/jsp/action/scheduler/addTodoAction.jsp?time=" + timeValue + "&content=" + contentValue + "&fullDate=" + fullDateValue;

    }

}

function deleteTodo(idxValue,date){
    var checked = confirm("해당 일정을 삭제하시겠습니까?");
    if(checked == true){
        location.href = "/scheduler_project/jsp/action/scheduler/deleteTodoAction.jsp?idx=" + idxValue + "&date=" + date; 
    }
}
