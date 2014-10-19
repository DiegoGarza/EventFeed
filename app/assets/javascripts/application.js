// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require parsley
// require parsley_es
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .
//= require turbolinks

$(function(){
  $('.btn-toggle').click(function() {
    $(this).find('.btn').toggleClass('active');  
    
    if ($(this).find('.btn-primary').size()>0) {
      $(this).find('.btn').toggleClass('btn-primary');
    }
    if ($(this).find('.btn-danger').size()>0) {
      $(this).find('.btn').toggleClass('btn-danger');
    }
    if ($(this).find('.btn-success').size()>0) {
      $(this).find('.btn').toggleClass('btn-success');
    }
    if ($(this).find('.btn-info').size()>0) {
      $(this).find('.btn').toggleClass('btn-info');
    }
    
    $(this).find('.btn').toggleClass('btn-default');
  })
  var myPos;

  var geoloc;

  var succesfull = function (position) {
    geoloc = {
      longitude: position.coords.longitude,
      latitude: position.coords.latitude
    };
  };

  var getLocation = function(callback){
    navigator.geolocation.getCurrentPosition(function(pos){
        succesfull(pos);
        typeof callback === 'function' && callback(geoloc);
    }, function(){
        alert("fail");
    });
  };

  getLocation(function(pos){
    myPos = pos;
    console.log(myPos);
  });

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(60, 105),
      content: content
    };

    var infowindow = new google.maps.InfoWindow(options);
    map.setCenter(options.position);
  }

  if($('#comment')){
    $( "#comment" ).focusin(function() {
      $('#tips').slideIn();
    });
  }
  
  // console.log(google.maps.geometry.spherical.computeDistanceBetween (pos1, pos2));
  
});