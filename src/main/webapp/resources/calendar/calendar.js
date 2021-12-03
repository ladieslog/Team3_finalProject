let date = new Date();

const renderCalendar = () => {
	var monthNames = ["January", "February", "March", "April", "May", "June",
 			 "July", "August", "September", "October", "November", "December"];

	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();

	// year-month 채우기
	document.querySelector('.year').textContent = `${viewYear}`;
	document.querySelector('.month').textContent = `${monthNames[date.getMonth()]}`;
	
	// 지난 달 마지막 Date, 이번 달 마지막 Date
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);

	const PLDate = prevLast.getDate();
	const PLDay = prevLast.getDay();

	const TLDate = thisLast.getDate();
	const TLDay = thisLast.getDay();

	// Dates 기본 배열들
	const prevDates = [];
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];

	// prevDates 계산
	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			prevDates.unshift(PLDate - i);
		}
	}

	// nextDates 계산
	for (let i = 1; i < 7 - TLDay; i++) {
		nextDates.push(i)
	}

	// Dates 합치기
	const dates = prevDates.concat(thisDates, nextDates);
	
	// Dates 정리
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	dates.forEach((date, i) => {
		const condition = (i >= firstDateIndex) && (i < lastDateIndex + 1)
		        ? 'thisMonth' : 'otherMonth';
			    
		dates[i] = `<div class="date"><span class="${condition}">${date}</span></div>`;
	});

	// Dates 그리기
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

renderCalendar();

const prevMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
};

const prevYear = () => {
	date.setYear(date.getFullYear() - 1);
	renderCalendar();
};

const nextMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
};

const nextYear = () => {
	date.setYear(date.getFullYear() + 1);
	renderCalendar();
};

const goToday = () => {
	date = new Date();
	renderCalendar();
};
