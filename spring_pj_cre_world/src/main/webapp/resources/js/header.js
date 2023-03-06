
var obTimeOut;
var creImage = document.getElementById('creImage');
var logo = document.createElement('img');
var count = 0;
function getDateString(now) {
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    if (month < 10) {
        month = '0' + month;
    }
    var day = now.getDate();
    if (day < 10) {
        day = '0' + day;
    }
    var hour = now.getHours();
    if (hour < 10) {
        hour = '0' + hour;
    }
    var min = now.getMinutes();
    if (min < 10) {
        min = '0' + min;
    }
    var sec = now.getSeconds();
    if (sec < 10) {
        sec = '0' + sec;
    }
    var str = `\n${year}-${month}-${day}\n${hour} : ${min} : ${sec}`;
    return str;
}
function startAnimation() {
    obTimeOut = window.setTimeout(lotation(), 100);
}
function lotation() {
    count++;
    if (count > 2) {
        count = 1;
    }
    if (count <= 2) {
        if (count == 2) {
            document.getElementById('logoTime').innerHTML = "";
            var creImage = document.createElement('img');
            creImage.src = '/resources/img/creLogo.jpg';
            document.getElementById('logoTime').appendChild(creImage);
            obTimeOut = window.setTimeout(lotation, 3000);
        } else {
            document.getElementById('logoTime').innerHTML = "";
            var now = new Date();
            var time = document.createElement('span');
            time.innerText = getDateString(now);
            document.getElementById('logoTime').appendChild(time);
            obTimeOut = window.setTimeout(lotation, 3000);
        }
    } else { window.clearTimeout(obTimeOut); }
}

window.onload = startAnimation;