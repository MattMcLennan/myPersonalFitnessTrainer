$( document ).ready(function() {

   $('button').click(function() {
      $.ajax({
         url: "users/generate_user_info",
         type: "get",
         dataType : "json",
         success: success,
         error: error
       });

      function success(results) {
         debugger
      }

      function error() {
         debugger
      }
   });
});

