$( document ).ready(function() {

   $.ajax({
      url: "sessions/generate_user_info",
      type: "get",
      dataType : "json",
      success: success,
      error: error
    });

   function success(results) {
      






   }

   function error() {
   }
});
