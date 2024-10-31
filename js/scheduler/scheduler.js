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

//일 표시칸 추가 함수
// function importDayContainer() {
//     var parent = document.getElementById("schedulerMainFrame");
//     var todoListPopup = document.getElementById("todoList");
//     var popupContainer = document.getElementById("popupContainer");

//     for (var i = 0; i < 31; i++) { // 추후 변수로 지정하여서 월별 칸 생성 개수 조절
//         var importDayContainer = document.createElement("div");
//         importDayContainer.className = "importDayContainer";
//         importDayContainer.id = i;
//         importDayContainer.innerHTML = i + 1;

//         // 일 표시 칸 클릭시 리스트 팝업 표시
//         importDayContainer.onclick = function() {
//             todoListPopup.style.display = "flex";
//             // var popupHeader = document.getElementById("popupHeader");
//             // popupHeader.innerHTML = importDayContainer.innerHTML;
//         }

//         parent.appendChild(importDayContainer);
//     }

//     // 외부 영역 클릭시 팝업창 닫음
    // window.addEventListener('mouseup', function(e) {
    //     if (!popupContainer.contains(e.target) && todoListPopup.style.display === "flex") {
    //         todoListPopup.style.display = "none";
    //     }
    // });
// }



//importDayContainer();

function showFixInfoPopup(event){
    var popup = document.getElementById("infoFix");
    popup.style.display = "flex";    
}

function hideFixInfoPopup(evnet){
    var popup = document.getElementById("infoFix");
    popup.style.display = "none";  
}

function f(){
   alert("버튼을 눌렀습니다.")
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