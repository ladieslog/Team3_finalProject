$(function() {

	var request = $.ajax({
		url: "/root/ajaxCal.do",
		method: "GET",
		dataType: "json"
	});
	
	request.done(function(data) {
		
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			events: data,
			
			eventClick: function(info) {
				for(let i=0 ; i<data.length; i++){
					if(info.event.title === data[i].title){
						numStr = data[i].num;
						location.href = "http://localhost:8085/root/diaryView?num=" + numStr + '';
						break;
					}
				}
			}
		});

		calendar.render();
	});

	request.fail(function(jqXHR, textStatus) {
		alert("Request failed: " + textStatus);
	});
});
