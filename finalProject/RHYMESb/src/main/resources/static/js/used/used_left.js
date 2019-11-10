function category(th){

	var category = $(th).attr('val');
	
	location.href="usedlist?category="+category;
	
}


function popupOpen(){
	var url= "popup";    //팝업창 페이지 URL
	var winWidth = 400;
    var winHeight = 470;
    
    var popupX = (window.screen.width / 2) - (400 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (500 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}



//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
  } else {
    dropdownContent.style.display = "block";
  }
});
}
