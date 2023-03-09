window.onload = function () { buildCalendar(); }
let nowMonth = new Date();
let today = new Date();
today.setHours(0, 0, 0, 0);
function buildCalendar() {
    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);

    let tbody_calendar = document.querySelector(".calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();
    document.getElementById("calMonth").innerText = nowMonth.getMonth() + 1;

    while (tbody_calendar.rows.length > 0) {
        tbody_calendar.deleteRow(tbody_calendar.rows.length - 1);
    }

    let nowRow = tbody_calendar.insertRow();

    for (let j = 0; j < firstDate.getDay(); j++) {
        let nowColumn = nowRow.insertCell();
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {
        let nowColumn = nowRow.insertCell();
        nowColumn.innerText = nowDay.getDate();

        if (nowDay.getDay() === 0) {
            nowColumn.style.color = "#DC143C";
        }
        if (nowDay.getDay() === 6) {
            nowColumn.style.color = "#0000CD";
            nowRow = tbody_calendar.insertRow();
        }

        if (nowDay < today) {
            nowColumn.className = "pastDay";
        } else if (nowDay.getFullYear() === today.getFullYear() && nowDay.getMonth() === today.getMonth() && nowDay.getDate() == today.getDate()) {
            nowColumn.className = "today";
            nowColumn.onclick = function () {
                choiceDate(this);
            }
        } else {
            nowColumn.className = "futureDay";
            nowColumn.onclick = function () { choiceDate(this); }
        }
    }
}
function choiceDate(nowColumn) {
    if (document.getElementsByClassName("choiceDay")[1]) {
        document.getElementsByClassName("choiceDay")[1].classList.remove("choiceDay");
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }
    nowColumn.classList.toggle("choiceDay");
}
function prev() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());
    buildCalendar();
}
function next() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());
    buildCalendar();
}

function leftPad(value) {
    if (value < 10) {
        value = '0' + value;
        return value;
    }
    return value;
}

function count(type) {
    const resultElement = document.getElementById('numOfPeople');
    let number = resultElement.innerText;
    if (type === 'plus') {
        if (number < 4) {
            number = parseInt(number) + 1;
        } else {
            return;
        }
    } else if (type === 'minus') {
        if (number > 1) {
            number = parseInt(number) - 1;
        }
    }
    resultElement.innerText = number;
}