// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require turbolinks
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function () {
  $('#calendar').fullCalendar({
    header:{
      left: 'prev, next, today',
      center: 'title',
      right: 'month, agendaWeek, agendaDay, listMonth',
    },
    height: 1000,
    events: '/end_user/events.json',
  });
});

$(function(){
	$('select').change(function(){
		video.playbackRate = Number($('option:selected').val());
	});
});

$(function(){
  $('#repeat').on('click',function(){
    if(video.loop === true){
      video.loop = false;
      $(this).css({ 'color': ''});
    }else if(video.loop === false){
      video.loop = true;
      $(this).css({ 'color': 'blue'});
    }
  });
});

$(function() {
    $(document).on("ajax:success", ".fav", function(e) {
      if ($('#' + e.detail[0]).hasClass('fa-star-color')) {
        $('#' + e.detail[0]).removeClass('fa-star-color');
      } else {
        $('#' + e.detail[0]).addClass('fa-star-color');
      }
    });
  });

