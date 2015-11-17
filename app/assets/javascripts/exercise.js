<<<<<<< HEAD
// We need to figure out how to
// bench = [], squat = [], deadlift = [], barbell_row = [], overhead_press = []
// var count = 0;

// $(function(){

=======
// $(function(){
//
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
//   $.ajax({
//     type: 'get',
//     url: '/exercises',
//     datatype: 'json'
//   }).then(function(current_user_data){
<<<<<<< HEAD

//     var minDate = new Date(current_user_data.created_at),
//         minDay = minDate.getDate(),
//         minMonth = minDate.getMonth(),
//         minYear = minDate.getFullYear();

//     var update,
//         temp = update;

//     update = new Date(current_user_data.updated_at);

=======
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
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
//     var updateDay = update.getDate(),
//         updateMonth = update.getMonth(),
//         updateYear = update.getFullYear(),
//         updateExercise = current_user_data;
<<<<<<< HEAD

=======
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
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
//     if (update != temp){
//       bench.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.bench]);
//       squat.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.squat]);
//       deadlift.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.deadlift]);
//       barbell_row.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.barbell_row]);
//       overhead_press.push([Date.UTC(updateYear, updateMonth, updateDay), updateExercise.overhead_press]);
//     }
<<<<<<< HEAD
//     count ++;

=======
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
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
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
<<<<<<< HEAD
//         max: 300
=======
//         max: 1000
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
//       },
//       tooltip: {
//         headerFormat: '<b>{series.name}</b><br>',
//         pointFormat: '{point.x:%e. %b}: {point.y:.2f} lbs'
//       },
<<<<<<< HEAD

=======
//
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
//       plotOptions: {
//         spline: {
//           marker: {
//             enabled: true
//           }
//         }
//       },
//       series: [{
//         name: 'Bench',
<<<<<<< HEAD
//         data: bench
//       }, {
//         name: 'Squat',
//         data: squat
//       }, {
//         name: 'Overhead Press',
//         data: overhead_press
//       }, {
//         name: 'Barbell Row',
//         data: barbell_row
//       }, {
//         name: 'Deadlift',
//         data: deadlift
//       }]
//     });
//   });

//   $(".button-collapse").sideNav();

// });

=======
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
>>>>>>> 8fa540cab69dde3383f38b7b8d2eb6a908d13559
