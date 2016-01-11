$(document).on("page:load", function(){
  attendListener();
  unattendListener();
});

function attendListener(){
  $(".open-classes-container").on("ajax:success", ".attend", function(event, data){
    debugger;
    $(this).parent().html(data.unattend_button);
  });
}

function unattendListener(){
  $(".open-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).parent().html(data.attend_button);
  });
}