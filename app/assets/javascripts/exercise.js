$(function(){

  $.ajax({
    type: 'get',
    url: '/exercises',
    datatype: 'json'
  }).then(function(results){

    var barbell_row = [],
        bench = [],
        deadlift = [],
        overhead_press = [],
        squat = [];

    for (var i = 0; i < results.length; i++) {
        date = new Date(results[i].created_at);
        utc = Date.UTC(date.getFullYear(),date.getMonth(),date.getDate());

        barbell_row.push([utc, results[i].barbell_row]);
        bench.push([utc, results[i].bench]);
        deadlift.push([utc, results[i].deadlift]);
        overhead_press.push([utc, results[i].overhead_press]);
        squat.push([utc, results[i].squat]);
    }

    $('#weightProgression').highcharts({
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
        min: 0
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
});
