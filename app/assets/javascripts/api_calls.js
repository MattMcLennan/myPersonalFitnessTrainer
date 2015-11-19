$(document).ready(function() {

  $.ajax({
    url: "sessions/generate_user_info",
    type: "get",
    dataType: "json",
    success: success,
    error: error
  });

   function success(results) {
      debugger
      var cals_in = results.user_calorie_goal;
      var cals_out = results.user_calorie_intake;
      var body_weight_goal = results.body_weight_goal;
      var body_start_weight = results.body_start_weight;
      var body_weight_today = results.body_weight_today;
      calorie_chart(cals_in, cals_out);
      weight_goal_gauge(body_start_weight, body_weight_goal, body_weight_today);

   }

  function error() {}
});

function calorie_chart(cals_in, cals_out) {
  $('#calorieGraph').highcharts({

      chart: {
        type: 'gauge',
        plotBackgroundColor: null,
        plotBackgroundImage: null,
        plotBorderWidth: 0,
        plotShadow: false
      },

      title: {
        text: 'Calories In vs Out',
        y: 5
      },
      credits: {
        enabled: false
      },

      pane: {
        startAngle: -120,
        endAngle: 120,
        background: [{
          borderWidth: 0,
          outerRadius: '109%'
        }, {
          backgroundColor: {
            // linearGradient: {
            //   x1: 0,
            //   y1: 0,
            //   x2: 0,
            //   y2: 1
            // },
            stops: [
              [0, '#ffffff'],
              [1, '#ffffff']
            ]
          },
          borderWidth: 1,
          outerRadius: '107%'
        }, {
          // default background
        }, {
          backgroundColor: '#ffffff',
          borderWidth: 0,
          outerRadius: '0%',
          innerRadius: '103%'
        }]
      },

      // the value axis
      yAxis: {
        min: 0,
        max: cals_out + 250 + 400,

        minorTickInterval: '1',
        minorTickWidth: 1,
        minorTickLength: 1,
        minorTickPosition: 'inside',
        minorTickColor: '#666',

        tickPixelInterval: 0,
        tickWidth: 0,
        tickPosition: 'inside',
        tickLength: 0,
        tickColor: '#666',
        labels: {
          step: 2,
          rotation: 'auto'
        },
        title: {
          text: ''
        },
        plotBands: [{
          from: 0,
          to: cals_out - 250,
          color: '#fad60a ' // yellow
        }, {
          from: cals_out - 250,
          to: cals_out + 250,
          color: '#b0e52c' // green
        }, {
          from: cals_out + 250,
          to: cals_out + 400 + 250,
          color: '#fe951b ' // red
        }]
      },

      series: [{
        name: 'Calories In',
        data: [cals_in],
        tooltip: {
          valueSuffix: ''
        }
      }]

    },
    // Add some life
    function(chart) {
      if (!chart.renderer.forExport) {
        var point = chart.series[0].points[0];
      }
    });
}

function weight_goal_gauge(body_start_weight, body_weight_goal, body_weight_today) {

  function data_calc(body_start_weight, body_weight_goal, body_weight_today) {
    if (body_weight_goal > body_start_weight) {
      if (body_weight_today >= body_weight_goal) {
        return 100;
      } else if (body_weight_today <= body_start_weight) {
        return 0;
      } else {
        return Math.round((1-(Math.abs(body_weight_today - body_weight_goal)/Math.abs(body_start_weight - body_weight_goal)))*100);
      }
    } else {
      if (body_weight_today <= body_weight_goal) {
        return 100;
      } else if (body_weight_today >= body_start_weight) {
        return 0;
      } else {
        return Math.round((1-(Math.abs(body_weight_today - body_weight_goal)/Math.abs(body_start_weight - body_weight_goal)))*100);
      }
    }
  }

  var gaugeOptions = {

    chart: {
      type: 'solidgauge'
    },

    title: {
      text: 'Goal Weight Progress',
      fontFamily: "Roboto"

    },

    pane: {
      center: ['50%', '85%'],
      size: '120%',
      startAngle: -90,
      endAngle: 90,
      background: {
        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
        innerRadius: '60%',
        outerRadius: '100%',
        shape: 'arc'
      }
    },

    tooltip: {
      enabled: false
    },

    // the value axis
    yAxis: {
      stops: [
        [0.1, '#fe951b'], // red
        [0.5, '#b0e52c'], // green
        [0.9, '#b0e52c'] // green
      ],
      lineWidth: 0,
      minorTickInterval: null,
      tickPixelInterval: 400,
      tickWidth: 0,
      startOnTick:true,
      title: {
        y: -20
      },
      labels: {
        y: 30
      }
    },

    plotOptions: {
      solidgauge: {
        dataLabels: {
          y: -75,
          borderWidth: 0,
          useHTML: true
        },
        events: {
          afterAnimate: function () {
            $(".highcharts-axis-labels text:nth-child(1)").text(body_start_weight).css({"font-size": "155%"});
            $(".highcharts-axis-labels text:nth-child(3)").text(body_weight_goal).css({"font-size": "155%"});
            $(".highcharts-axis-labels text:nth-child(2)").remove();

          }
        }
      }
    }
  };
  // The speed gauge
  $('#goalWeight').highcharts(Highcharts.merge(gaugeOptions, {
    yAxis: {
      min: 0,
      max: 100
    },

    credits: {
      enabled: false
    },

    series: [{
      name: 'Speed',
      data: [data_calc(body_start_weight, body_weight_goal, body_weight_today)],
      dataLabels: {
        format: '<div style="text-align:center"><span style="font-size:25px;color:' +
          ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
          '<span style="font-size:16px;color:silver">%</span></div>'

      },
      tooltip: {
        valueSuffix: ' km/h'
      }
    }]

  }));

}
