var addButton = document.getElementById("addIndex");
addButton.addEventListener("click", function(){
    var timeValue = document.getElementById("inputTime").value;
    var contentValue = document.getElementById("inputTodo").value;
    
    location.href = "/scheduler_project/jsp/action/scheduler/addTodoAction.jsp?time=" + timeValue + "&content=" + contentValue;
})