function showSideMenu(e){
    var hideMenu = document.getElementById("leftSideMenu");
    hideMenu.style.display = "none";
    var hideMenu = document.getElementById("rightSideMenu");
    hideMenu.style.display = "none";

    var showMenu = document.getElementById("sideMenuUnfolded");
    showMenu.style.display = "flex";
}

function hideSideMenu(e){
    var hideMenu = document.getElementById("leftSideMenu");
    hideMenu.style.display = "flex";
    var hideMenu = document.getElementById("rightSideMenu");
    hideMenu.style.display = "flex";

    var showMenu = document.getElementById("sideMenuUnfolded");
    showMenu.style.display = "none";
}

// function 

// for (var i = 0; i< 31; i++){
//     var parent = document.getElementById("schedulerMainFrame");

//     var dayContainer = document.createElement("div");
//     dayContainer.class = "dayContainer";

//     parent.appendchild("dayContainer");
// }