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
<<<<<<< HEAD
//= require jquery
//= require jquery_ujs
//= require bootstrap
=======
//=require jquery
//=require jquery_ujs
//=require bootstrap
//= require turbolinks
>>>>>>> 53132bd0914ad38e34c37220370ace861322d5bb
//= require rails-ujs
//= require turbolinks
//= require activestorage
//= require_tree .
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all

$(document).on('turbolinks:load', () => {
  $('#query').on('input', function() {
    if (this.value.length >= 0) Rails.fire($('#search')[0], 'submit')
  })

  $('#code').on('input', function() {
    if (this.value.length >= 0) Rails.fire($('#search')[0], 'submit')
  })

  $('#description').on('input', function() {
    if (this.value.length >= 0) Rails.fire($('#search')[0], 'submit')
  })

  $('#term').on('change', () => Rails.fire($('#search')[0], 'submit'))
})

ScrollReveal().reveal('.hideme');

// $('#calendar').fullCalendar();
// 
//
// $(document).ready(function(){
//   var initialize_calendar;
//   initialize_calendar = function() {
//     $('.calendar').each(function(){
//       var calendar = $(this);
//       calendar.fullCalendar({
//         header: {
//           left: 'prev,next today',
//           center: 'title',
//           right: 'month,agendaWeek,agendaDay'
//         },
//         selectable: true,
//         selectHelper: true,
//         editable: true,
//         eventLimit: true,
//         events: '/events.json',
//
//         select: function(start, end) {
//           $.getScript('/events/new', function() {
//             $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
//             date_range_picker();
//             $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
//             $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
//           });
//
//           calendar.fullCalendar('unselect');
//         },
//
//         eventDrop: function(event, delta, revertFunc) {
//           event_data = {
//             event: {
//               id: event.id,
//               start: event.start.format(),
//               end: event.end.format()
//             }
//           };
//           $.ajax({
//               url: event.update_url,
//               data: event_data,
//               type: 'PATCH'
//           });
//         },
//
//         eventClick: function(event, jsEvent, view) {
//           $.getScript(event.edit_url, function() {
//             $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
//             date_range_picker();
//             $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
//             $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
//           });
//         }
//       });
//     })
//   };
//   $(document).on('turbolinks:load', initialize_calendar);
//
//   var date_range_picker;
//   date_range_picker = function() {
//     $('.date-range-picker').each(function(){
//       $(this).daterangepicker({
//           timePicker: true,
//           timePickerIncrement: 30,
//           alwaysShowCalendars: true
//       }, function(start, end, label) {
//         $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
//         $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
//       });
//     })
//   };
//   $(document).on('turbolinks:load', date_range_picker);
//
// });
