document.getElementById('logout-button')?.addEventListener('click', () => {
  document.getElementById('logout-form').submit();
});

let calendarElement = document.getElementById('calendar');
if (calendarElement) {
  document.addEventListener('DOMContentLoaded', () => {
    let calendar = new FullCalendar.Calendar(calendarElement, {
      locale: 'de',
      initialView: 'dayGridMonth',
      firstDay: 1,
      initialDate: calendarElement.dataset.date,
      headerToolbar: {
        start: 'title',
        center: '',
        end: 'prev,next',
      },
      eventSources: [
        {
          events: [
            {
              title: 'Errechneter Termin',
              start: calendarElement.dataset.date,
            },
          ],
          color: 'red',
          textColor: 'black',
        },
        {
          url: '/kalender',
          method: 'POST',
        },
      ]
    });
    calendar.render();
  });
}
