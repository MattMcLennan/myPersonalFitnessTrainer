// $(function(){
//
//   $.ajax({
//     type: 'get',
//     url: '/exercises',
//     datatype: 'json'
//   }).then(function(current_user_data){
//
//     var minDate = new Date(current_user_data.created_at),
//         minDay = minDate.getDate(),
//         minMonth = minDate.getMonth(),
//         minYear = minDate.getFullYear(),
//         minExercise = current_user_data;
//
//     var update,
//         temp = update;
//
//     update = new Date(current_user_data.updated_at);
//
//     var updateDay = update.getDate(),
//         updateMonth = update.getMonth(),
//         updateYear = update.getFullYear(),
//         updateExercise = current_user_data;
//
//     var bench = [],
//         squat = [],
//         deadlift = [],
//         barbell_row = [],
//         overhead_press = [];
//
//     var countBench = 0,
//         countSquat = 0,
//         countDeadlift = 0,
//         countBarbell_row = 0,
//         countOverhead_press = 0;
//
//     if (update != temp){
//       bench.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.bench]);
//       squat.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.squat]);
//       deadlift.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.deadlift]);
//       barbell_row.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.barbell_row]);
//       overhead_press.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.overhead_press]);
//     }
//
//     for (countBench; countBench < bench.length; countBench++){
//       series[0].push({
//         data:[
//           bench[countBench]
//         ]
//       });
//     };
//
//     for (countSquat; countSquat < squat.length; countSquat++){
//       series[1].push({
//         data:[squat[countSquat]]
//       });
//     };
//
//     for (countOverhead_press; countOverhead_press < overhead_press.length; countOverhead_press++){
//       series[2].push({
//         data:[overhead_press[countOverhead_press]]
//       });
//     };
//
//     for (countBarbell_row; countBarbell_row < barbell_row.length; countBarbell_row++){
//       series[3].push({
//         data:[barbell_row[countBarbell_row]]
//       });
//     };
//
//     for (countDeadlift; countDeadlift < deadlift.length; countDeadlift++){
//       series[4].push({
//         data:[deadlift[countDeadlift]]
//       });
//     };
//
//     $('#container').highcharts({
//       chart: {
//         type: 'spline'
//       },
//       title: {
//         text: 'Weight Progression'
//       },
//       subtitle: {
//         text: 'Tracking The Main Lifts'
//       },
//       xAxis: {
//         type: 'datetime',
//         dateTimeLabelFormats: {
//           month: '%e. %b',
//           year: '%b'
//         },
//         title: {
//           text: 'Date'
//         }
//       },
//       yAxis: {
//         title: {
//           text: 'Weight (lbs)'
//         },
//         min: 0,
//         max: 1000
//       },
//       tooltip: {
//         headerFormat: '<b>{series.name}</b><br>',
//         pointFormat: '{point.x:%e. %b}: {point.y:.2f} lbs'
//       },
//
//       plotOptions: {
//         spline: {
//           marker: {
//             enabled: true
//           }
//         }
//       },
//       series: [{
//         name: 'Bench',
//         data: [
//           [Date.UTC(minYear, minMonth, minDay), minExercise.bench]
//         ]
//       }, {
//         name: 'Squat',
//         data: [
//           [Date.UTC(minYear, minMonth, minDay), minExercise.squat]
//         ]
//       }, {
//         name: 'Overhead Press',
//         data: [
//           [Date.UTC(minYear, minMonth, minDay), minExercise.overhead_press]
//         ]
//       }, {
//         name: 'Barbell Row',
//         data: [
//           [Date.UTC(minYear, minMonth, minDay), minExercise.barbell_row]
//         ]
//       }, {
//         name: 'Deadlift',
//         data: [
//           [Date.UTC(minYear, minMonth, minDay), minExercise.deadlift]
//         ]
//       }]
//     });
//   });
//
//
// });
