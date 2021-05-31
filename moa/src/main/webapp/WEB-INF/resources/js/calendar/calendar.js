  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
	
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      defaultDate: '2021-05-14',
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: arr
/*
		  events: [
	        {
	          title: '웁쓰양 개인전 - 그림 좋다',
			  url: '#',
	          start: '2021-04-17'
	        },
	        {
	          title: '초대의 감각',
			  url: '#',
	          start: '2021-05-01'
	        },
	        {
	          title: '이명미 개인전 : I am a person',
	          url: '#',
	          start: '2021-03-13'
	        },
	        {
	          title: '이현주 개인전 : 물질의 일일드라마',
			  url: '#',
	          start: '2021-04-22'
	        },
	        {
	          title: '볼로냐 일러스트 원화전 2020',
			  url: '#',
	          start: '2021-02-11'
	        },
	        {
	          title: '장 줄리앙 개인전 : 다시 안녕',
			  url: '#',
	          start: '2021-04-01'
	        },
	        {
	          title: '아마도 우리를 이끄는 것은 단지 불길한 예감일지도 모른다.',
			  url: '#',
	          start: '2021-04-22'
	        },
	        {
	          title: '사람 모양 재료',
			  url: '#',
	          start: '2021-04-17'
	        },
	        {
	          title: '공명: 자연이 주는 울림',
			  url: '#',
	          start: '2021-03-16'
	        },
	        {
	          title: '보더리스 사이트',
			  url: '#',
	          start: '2021-05-07'
	        }
	      ]
*/
	    });

	    calendar.render();

  });