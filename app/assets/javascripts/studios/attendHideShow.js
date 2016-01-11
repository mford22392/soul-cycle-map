$(document).on("page:change", function(){
  attendListener();
  unattendListener();
  unattendUserShowListener();
});



function attendListener(){
  $(".open-classes-container").on("ajax:success", ".attend", function(event, data){
    $(this).replaceWith(data.attend_button);
  });
}

function unattendListener(){
  $(".open-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
  });
}

function unattendUserShowListener(){
  $(".user-classes-container").on("ajax:success", ".unattend", function(event, data){
    // if there is only 1 on the list, remove it and add a child that says no classes
    if ($(this).parent().parent().children().length == 1) {
      $(this).parent().parent().parent().append( "<p>You have no upcoming classes.<p>" );
      $(this).parent().parent().parent().append( "<a href='/studios' class='btn btn-default btn-lg btn-block'>Add a class now!</a>" );
      $(this).parent().remove();
    }
    else {
      $(this).parent().remove();
    }
  });
}