    $(document).ready(function() {
        // page is now ready, initialize the calendar...
        if ($('#calendar').length != 0) {

          $('#calendar').fullCalendar({
              // put your options and callbacks here
              fixedWeekCount: false, //Determines the number of weeks displayed in a month view - if true (default), always six
              eventSources: [

              // your event source
              {
                  url: '/calendar.json', // the view/events/index.json.jbuilder-file
                  color: '#313030',    // the light-gray from our colours - somehow the variable didn't work here
                  textColor: 'white'
              }
              // any other sources...
           ]
          })
        }
    });
