$(function(){
  // Note: This example requires that you consent to location sharing when
  // prompted by your browser. If you see a blank space instead of the map, this
  // is probably because you have denied permission for location sharing.

  var map;

  var pos1;
  var pos2;

  function initialize() {
    var mapOptions = {
      zoom: 16
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);


    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = new google.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

        if($("#event_latitude").val(pos.lat())){
          $("#event_latitude").val(pos.lat());
          $("#event_longitude").val(pos.lng());
        }

        marker = new google.maps.Marker({
          position: pos,
          map: map,
          title:"Hello World!"
        });

        map.setCenter(pos);
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }
    
    google.maps.event.addListener(map, 'click', function(event) {
      placeMarker(event.latLng);
    });

  }

  function placeMarker(location) {
    if (marker == 'undefined'){
      marker = new google.maps.Marker({
        position: location,
        map: map
      });
    }
    else{
      marker.setPosition(location);
      $("#event_latitude").val(location.lat());
      $("#event_longitude").val(location.lng());
    }
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});
