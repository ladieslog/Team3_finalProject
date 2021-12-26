var checkList = [],
	checkListLength = 0,
	indate = [],
	outdate = [],
	person = [],
	title = [],
	location1 = [],
	listDate = [];

let date = new Date();


renderCalendar();

function readDB(month) {
	$.ajax({
		url: "/root/ajaxCal.do",
		Type: "POST",
		data: checkList,
		dataType: "json",
		success: function(data) {
			if (data.length == 0)
				alert("데이터가 없습니다");
			else {
				checkList = data;
				checkListLength = data.length;
				//checkThePast(month);
			}
		},
		error: function() {
			//alert("에러");
		}
	});
}
/*
function checkThePast(month) {
	console.log("month : " + month);
	for (let i = 0; i < checkList.length; i++) {
		getDateRange(month, checkList[i].indate, checkList[i].outdate, listDate);
	}
	console.log(listDate);
}

function getDateRange(month, startDate, endDate, listDate) {
	var dateMove = new Date(startDate);
	var strDate = startDate;
	console.log(startDate.substr(5, 2))

	if (startDate.substr(5, 2) === String(month + 1)) {

		if (startDate == endDate) {
			var strDate = dateMove.toISOString().slice(0, 10);
			listDate.push(strDate);
		}

		else {
			while (strDate < endDate) {
				var strDate = dateMove.toISOString().slice(0, 10);
				listDate.push(strDate);
				dateMove.setDate(dateMove.getDate() + 1);
			}
		}
	}
	return listDate;
}*/

function renderCalendar() {

	var monthNames = ["January", "February", "March", "April", "May", "June",
		"July", "August", "September", "October", "November", "December"];

	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();

	document.querySelector('.year').textContent = `${viewYear}`;
	document.querySelector('.month').textContent = `${monthNames[date.getMonth()]}`;

	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);

	const PLDate = prevLast.getDate();
	const PLDay = prevLast.getDay();

	const TLDate = thisLast.getDate();
	const TLDay = thisLast.getDay();

	const prevDates = [];
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];

	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			prevDates.unshift(PLDate - i);
		}
	}

	for (let i = 1; i < 7 - TLDay; i++) {
		nextDates.push(i)
	}

	const dates = prevDates.concat(thisDates, nextDates);

	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	dates.forEach((date, i) => {
		const condition = (i >= firstDateIndex) && (i < lastDateIndex + 1)
			? 'thisMonth' : 'otherMonth';

		dates[i] = `<div class="date"><span class="${condition}">${date}</span></div>`;
	});

	document.querySelector('.dates').innerHTML = dates.join('');

	const today = new Date();
	if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
		for (let date of document.querySelectorAll('.thisMonth')) {
			if (+date.innerText === today.getDate()) {
				date.classList.add('today');
				break;
			}
		}
	}
	
};

function prevMonth() {
	date.setDate(1);
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
};

function prevYear() {
	date.setYear(date.getFullYear() - 1);
	renderCalendar();
};

function nextMonth() {
	date.setDate(1);
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
};

function nextYear() {
	date.setYear(date.getFullYear() + 1);
	renderCalendar();
};

function goToday() {
	date = new Date();
	renderCalendar();
};
