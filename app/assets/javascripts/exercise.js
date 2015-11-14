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

    var updateDate;
    var temp = updateDate;

    updateDate = new Date(current_user_data.updated_at);

    var updateDay = updateDate.getDate(),
      updateMonth = updateDate.getMonth(),
      updateYear = updateDate.getFullYear();

    var bench = {}
    var squat = {}
    var deadlift = {}
    var barbell_row = {}
    var overhead_press = {}

    if (updateDate != temp){
      bench["date"] = [updateYear, updateMonth, updateDay];
      bench["exercise"] = current_user_data.bench;
      squat["date"] = [updateYear, updateMonth, updateDay];
      squat["exercise"] = current_user_data.squat;
      deadlift["date"] = [updateYear, updateMonth, updateDay];
      deadlift["exercise"] = current_user_data.deadlift;
      barbell_row["date"] = [updateYear, updateMonth, updateDay];
      barbell_row["exercise"] = current_user_data.barbell_row;
      overhead_press["date"] = [updateYear, updateMonth, updateDay];
      overhead_press["exercise"] = current_user_data.overhead_press;
    }

    console.log(bench);
    console.log(deadlift);
    console.log(squat);
    console.log(barbell_row);
    console.log(overhead_press);

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
          [Date.UTC(bench["date"][0], bench["date"][1], bench["date"][2]), bench["exercise"]],
        ]
      }, {
        name: 'Squat',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.squat],
          [Date.UTC(squat["date"][0], squat["date"][1], squat["date"][2]), squat["exercise"]],
        ]
      }, {
        name: 'Overhead Press',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.overhead_press],
          [Date.UTC(overhead_press["date"][0], overhead_press["date"][1], overhead_press["date"][2]), overhead_press["exercise"]],
        ]
      }, {
        name: 'Barbell Row',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.barbell_row],
          [Date.UTC(barbell_row["date"][0], barbell_row["date"][1], barbell_row["date"][2]), barbell_row["exercise"]],
        ]
      }, {
        name: 'Deadlift',
        data: [
          [Date.UTC(minYear, minMonth, minDay), current_user_data.deadlift],
          [Date.UTC(deadlift["date"][0], deadlift["date"][1], deadlift["date"][2]), deadlift["exercise"]],
        ]
      }]
    });
  });

  $(".button-collapse").sideNav();

});
