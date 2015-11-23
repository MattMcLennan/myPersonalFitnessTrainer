// We need to figure out how to
bench = [], squat = [], deadlift = [], barbell_row = [], overhead_press = []
var count = 0;

$(function(){

  $.ajax({
    type: 'get',
    url: '/exercises',
    datatype: 'json'
  }).then(function(current_user_data){

    var minDate = new Date(current_user_data.created_at),
        minDay = minDate.getDate(),
        minMonth = minDate.getMonth(),
        minYear = minDate.getFullYear();

    var update,
        temp = update;

    update = new Date(current_user_data.updated_at);

    var updateDay = update.getDate(),
        updateMonth = update.getMonth(),
        updateYear = update.getFullYear(),
        updateExercise = current_user_data;

    if (update != temp){
      bench.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.bench]);
      squat.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.squat]);
      deadlift.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.deadlift]);
      barbell_row.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.barbell_row]);
      overhead_press.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.overhead_press]);
    }
    count ++;
    debugger

    $('#container').highcharts({
      chart: {
        type: 'spline'
      },
      title: {
        text: 'Weight Progression'
      },
      subtitle: {
        text: 'Tracking The Main Lifts'
      },
      xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: {
          month: '%e. %b',
          year: '%b'
        },
        title: {
          text: 'Date'
        }
      },
      yAxis: {
        title: {
          text: 'Weight (lbs)'
        },
        min: 0,
        max: 300
      },
      tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%e. %b}: {point.y:.2f} lbs'
      },

      plotOptions: {
        spline: {
          marker: {
            enabled: true
          }
        }
      },
      series: [{
        name: 'Bench',
        data: bench
      }, {
        name: 'Squat',
        data: squat
      }, {
        name: 'Overhead Press',
        data: overhead_press
      }, {
        name: 'Barbell Row',
        data: barbell_row
      }, {
        name: 'Deadlift',
        data: deadlift
      }]
    });
  });

  $(".button-collapse").sideNav();

});

