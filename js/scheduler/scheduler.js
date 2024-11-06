//사이드 메뉴 활성화 함수
function showSideMenu(e){
    var hideMenu = document.getElementById("leftSideMenu");
    hideMenu.style.display = "none";
    var hideMenu = document.getElementById("rightSideMenu");
    hideMenu.style.display = "none";

    var showMenu = document.getElementById("sideMenuUnfolded");
    showMenu.style.display = "flex";
}

//사이드 메뉴 비활성화 함수
function hideSideMenu(e){
    var hideMenu = document.getElementById("leftSideMenu");
    hideMenu.style.display = "flex";
    var hideMenu = document.getElementById("rightSideMenu");
    hideMenu.style.display = "flex";

    var showMenu = document.getElementById("sideMenuUnfolded");
    showMenu.style.display = "none";
}


function logout(){
    var checked = confirm("로그아웃 하시겠습니까?");
    if(checked == true){
        location.href = "/scheduler_project/jsp/action/account/logoutAction.jsp";
    }
}

function showFixInfoPopup(event){
    var popup = document.getElementById("infoFix");
    popup.style.display = "flex";    
}

function hideFixInfoPopup(evnet){
    var popup = document.getElementById("infoFix");
    popup.style.display = "none";  
}



function listPopup(event){
    var todoListPopup = document.getElementById("todoList");
    todoListPopup.style.display = "flex";

    window.addEventListener('mouseup', function(e) {
        if (!popupContainer.contains(e.target) && todoListPopup.style.display === "flex") {
            todoListPopup.style.display = "none";
        }
    });
}