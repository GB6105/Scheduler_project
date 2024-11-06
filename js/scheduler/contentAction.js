function focusIn(idx){
    var option = document.getElementById("optionContainer_"+idx);
    option.style.display = "flex";
}

function foucusOut(idx){
    var option = document.getElementById("optionContainer_"+idx);
    option.style.display = "none";
}

function addTodo(fullDateValue){
    var timeValue = document.getElementById("inputTime").value;
    var contentValue = document.getElementById("inputTodo").value;            
    location.href = "/scheduler_project/jsp/action/scheduler/addTodoAction.jsp?time=" + timeValue + "&content=" + contentValue + "&fullDate=" + fullDateValue;
}

function deleteTodo(idxValue,date){
    location.href = "/scheduler_project/jsp/action/scheduler/deleteTodoAction.jsp?idx=" + idxValue + "&date=" + date; 
}
