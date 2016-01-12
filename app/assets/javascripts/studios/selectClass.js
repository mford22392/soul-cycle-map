$(document).on("page:change", function(){
  selectListener();
});



function attendListener(){
  $(".select-spin-class-js").on("ajax:success", function(event, data){
    debugger;
    $(this).replaceWith(data.attend_button);
  });
}