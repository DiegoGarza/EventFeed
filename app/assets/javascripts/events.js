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

        if($("#event_lat").val(pos.lat())){
          $("#event_lat").val(pos.lat());
          $("#event_lng").val(pos.lng());
        }
        pos1=pos;
        pos2= new google.maps.LatLng(pos1.lat()+0.000001, pos1.lng()+0.0000001);

        console.log(google.maps.geometry.spherical.computeDistanceBetween (pos1, pos2));

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
      $("#event_lat").val(location.lat());
      $("#event_lng").val(location.lng());
    }
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});
