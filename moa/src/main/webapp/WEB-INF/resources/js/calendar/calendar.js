  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
	
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      defaultDate: '2021-05-14',
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
		  events: [
	        {
	          title: '웁쓰양 개인전 - 그림 좋다',
			  url: '#',
	          start: '2021-04-17'
	        }
	      ]
	    });

	    calendar.render();

  });