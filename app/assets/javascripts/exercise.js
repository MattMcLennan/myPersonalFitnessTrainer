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

    var bench = {update: []},
        squat = {update: []},
        deadlift = {update: []},
        barbell_row = {update: []},
        overhead_press = {update: []};

    if (update != temp){
      bench["update"].push([updateYear, updateMonth, updateDay, updateExercise.bench]);
      squat["update"].push([updateYear, updateMonth, updateDay, updateExercise.squat]);
      deadlift["update"].push([updateYear, updateMonth, updateDay, updateExercise.deadlift]);
      barbell_row["update"].push([updateYear, updateMonth, updateDay, updateExercise.barbell_row]);
      overhead_press["update"].push([updateYear, updateMonth, updateDay, updateExercise.overhead_press]);
      debugger
    }

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
        max: 1000
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
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.bench],
          [Date.UTC(bench["update"][0], bench["update"][1], bench["update"][2]), bench["update"][3]],
        ]
      }, {
        name: 'Squat',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.squat],
          [Date.UTC(squat["update"][0], squat["update"][1], squat["update"][2]), squat["update"][3]],
        ]
      }, {
        name: 'Overhead Press',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.overhead_press],
          [Date.UTC(overhead_press["update"][0], overhead_press["update"][1], overhead_press["update"][2]), overhead_press["update"][3]],
        ]
      }, {
        name: 'Barbell Row',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.barbell_row],
          [Date.UTC(barbell_row["update"][0], barbell_row["update"][1], barbell_row["update"][2]), barbell_row["update"][3]],
        ]
      }, {
        name: 'Deadlift',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.deadlift],
          [Date.UTC(deadlift["update"][0], deadlift["update"][1], deadlift["update"][2]), deadlift["update"][3]],
        ]
      }]
    });
  });

  $(".button-collapse").sideNav();

});
