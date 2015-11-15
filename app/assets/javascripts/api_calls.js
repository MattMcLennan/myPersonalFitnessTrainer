$( document ).ready(function() {

   $.ajax({
      url: "sessions/generate_user_info",
      type: "get",
      dataType : "json",
      success: success,
      error: error
    });

   function success(results) {
      var cals_in = results.user_calorie_goal
      var cals_out = results.user_calorie_intake
      calorie_chart(cals_in, cals_out);
   }

   function error() {
   }
});

function calorie_chart(cals_in, cals_out) {
  $('#container2').highcharts({

      chart: {
        type: 'gauge',
        plotBackgroundColor: null,
        plotBackgroundImage: null,
        plotBorderWidth: 0,
        plotShadow: false
      },

      title: {
        text: 'Calories In vs Out'
      },

      pane: {
        startAngle: -120,
        endAngle: 120,
        background: [{
          borderWidth: 0,
          outerRadius: '109%'
        }, {
          backgroundColor: {
            linearGradient: {
              x1: 0,
              y1: 0,
              x2: 0,
              y2: 1
            },
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
        max: 3000,

        minorTickInterval: '1',
        minorTickWidth: 1,
        minorTickLength: 1,
        minorTickPosition: 'inside',
        minorTickColor: '#666',

        tickPixelInterval: 100,
        tickWidth: 2,
        tickPosition: 'inside',
        tickLength: 10,
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
          to: 1000,
          color: '#fad60a ' // yellow
        }, {
          from: cals_in - 250,
          to: cals_out + 250,
          color: '#b0e52c' // green
        }, {
          from: 2000,
          to: 3000,
          color: '#fe951b ' // red
        }]
      },

      series: [{
        name: 'Speed',
        data: [2000],
        tooltip: {
          valueSuffix: ' km/h'
        }
      }]

    },
    // Add some life
    function(chart) {
      if (!chart.renderer.forExport) {
        setInterval(function() {
          var point = chart.series[0].points[0],
            newVal,
            inc = Math.round((Math.random() - 0.5) * 20);

          newVal = point.y + inc;
          if (newVal < 0 || newVal > 200) {
            newVal = point.y - inc;
          }

          point.update(newVal);

        }, 3000);
      }
    });
}