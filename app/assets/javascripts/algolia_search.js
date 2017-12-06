// Algolia front search box JS, some of the remaining JS is in application.html.erb

// 1. Using only 1 index:

// var client = algoliasearch("8J893PQF95", "9329dc59c8324d9fe5e9f3754cc057f1");
// // Also works this way:
// // var index = client.initIndex('dev_event_and_venue');
// var index = client.initIndex('Event');
// //initialize autocomplete on search input (ID selector must match)
// autocomplete('#aa-search-input',
//   { hint: false }, {
//     source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
//   //value to be displayed in input control after user's suggestion selection
//   displayKey: 'name',
//   //hash of templates used when rendering dataset
//   templates: {
//       //'suggestion' templating function used to render a single suggestion
//       suggestion: function(suggestion) {
//         return '<span>' +
//         suggestion._highlightResult.name.value + '</span> - <span>' +
//         suggestion._highlightResult.category.value + '</span>';
//       }
//     }
//   });


// 2. With double index:

var client = algoliasearch("8J893PQF95", "9329dc59c8324d9fe5e9f3754cc057f1")
var events = client.initIndex('Event');
var venues = client.initIndex('Venue');

autocomplete('#aa-search-input', {}, [
    {
      source: autocomplete.sources.hits(events, { hitsPerPage: 3 }),
      displayKey: 'name',
      templates: {
        header: '<div class="aa-suggestions-category">Events</div>',
        suggestion: function(suggestion) {
          return `<a href="${window.location.origin}/events/${suggestion.objectID}"><span>` +
            suggestion._highlightResult.name.value + '</span> - <span>'
              + suggestion._highlightResult.category.value + '</span></a>';
        }
      }
    },
    {
      source: autocomplete.sources.hits(venues, { hitsPerPage: 3 }),
      displayKey: 'name',
      templates: {
        header: '<div class="aa-suggestions-category">Venues</div>',
        suggestion: function(suggestion) {
          return `<a href="${window.location.origin}/venues/${suggestion.objectID}"><span>` +
            suggestion._highlightResult.name.value + '</span> - <span>'
              + suggestion._highlightResult.city.value + '</span></a>';
        }
      }
    }
]);


// Interpolation or I store the results in a var and play with the id selector
// <a href="http://www.apollo-cultu.re/events/${Event.objectID}">            </a>
