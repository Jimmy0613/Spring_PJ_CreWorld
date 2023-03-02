
var obTimeOut;
var ObjectArray = new Array();
ObjectArray[1] = "resources/img/creLogo.jpg";
ObjectArray[2] = "resources/img/textCreworld.jpg";
var nObjectCnt = 0;
function startAnimation() {
    obTimeOut = window.setTimeout(ShowDefaultRotate(), 100);
}
function ShowDefaultRotate() {
    nObjectCnt++;
    if (nObjectCnt >= ObjectArray.length) {
        nObjectCnt = 1;
    }
    if (nObjectCnt < ObjectArray.length) {
        var img = document.getElementById("img_id");
        img.src = ObjectArray[nObjectCnt];
        obTimeOut = setTimeout("ShowDefaultRotate()", 5000);
    } else {
        clearTimeout(obTimeOut);
    }
}
window.onload = startAnimation;
