var client = algoliasearch("8J893PQF95", "9329dc59c8324d9fe5e9f3754cc057f1");
var index = client.initIndex('dev_event_and_venue');
//initialize autocomplete on search input (ID selector must match)
autocomplete('#aa-search-input',
{ hint: false }, {
  source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
  //value to be displayed in input control after user's suggestion selection
  displayKey: 'name',
  //hash of templates used when rendering dataset
  templates: {
      //'suggestion' templating function used to render a single suggestion
      suggestion: function(suggestion) {
        console.log(suggestion)
        return '<span>' +
          // suggestion._highlightResult.event.value + '</span><span>' +
          suggestion._highlightResult.name.value + '</span>';
        }
    }
});

