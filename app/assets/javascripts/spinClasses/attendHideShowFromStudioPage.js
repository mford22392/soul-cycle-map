$(document).on("page:change", function(){
  attendListener();
  unattendListener();
});



function attendListener(){
  $(".selected-classes-container").on("ajax:success", ".attend", function(event, data){
    $(this).replaceWith(data.attend_button);
  });
}

function unattendListener(){
  $(".selected-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
  });
}
