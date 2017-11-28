// Gmaps.map.callback = function(){
//   var len = Gmaps.map.markers.length;
//   var markers = Gmaps.map.markers;
//   var anchor = new google.maps.Point(9.5, 34);
//   var sAnchor = new google.maps.Point(0, 34);
//   var origin = new google.maps.Point(0, 0);
//   var sOrigin = new google.maps.Point(28.5, 0);
//   var size = new google.maps.Size(28.5,34);

//   var markerNormal = new google.maps.MarkerImage("/assets/marker_sprite.png", size, origin, anchor);
//   var markerHighlight = new google.maps.MarkerImage("/assets/marker_sprite_bleu.png", size, origin, anchor);
//   var shadow = new google.maps.MarkerImage("/assets/marker_sprite.png", size, sOrigin, sAnchor);
//   for(var i = 0; i < len; i++){
//     m = Gmaps.map.markers[i];
//     google.maps.event.addListener(m.serviceObject, 'click',
//       (function(m, markers){
//         return function(){
//           console.log(m);
//           for(a in markers){
//             markers[a].serviceObject.setIcon(markerNormal);
//             markers[a].serviceObject.setZIndex(1);
//             markers[a].serviceObject.shadow = shadow;
//           }
//           Gmaps.map.map.setZoom(7);
//           m.serviceObject.setZIndex(99);
//           m.serviceObject.setIcon(markerHighlight);
//         }
//       }(m, markers))
//       )
//   }
// }



// var handler = Gmaps.build('Google');

// handler.buildMap({ provider: {styles: styles},

// internal: { id: 'map-search' } }, function() {

// markers = handler.addMarkers(<%= raw @hash.to_json %>);

// handler.bounds.extendWith(markers);
// handler.fitMapToBounds();
// if (markers.length == 0) {
// handler.getMap().setZoom(2);
// } else if (markers.length == 1) {
// handler.getMap().setZoom(14);
// }
// });
