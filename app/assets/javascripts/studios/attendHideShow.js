$(document).on("page:change", function(){
  attendListener();
  unattendListener();
  unattendCurrentUserShowListener();
  friendAttendListener();
  friendUnattendListener();
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

function unattendCurrentUserShowListener(){
  $(".current-user-classes-container").on("ajax:success", ".unattend", function(event, data){
    // if there is only 1 on the list, remove it and add a child that says no classes
    if ($(this).parent().parent().children().length == 1) {
      $(this).parent().parent().parent().append( "<p>No upcoming classes.<p>" );
      $(this).parent().parent().parent().append( "<a href='/studios' class='btn btn-default btn-lg btn-block'>Add a class now!</a>" );
      $(this).parent().remove();
    }
    else {
      $(this).parent().remove();
    }
  });
}

function friendAttendListener(){
  $(".current-classes-container").on("ajax:success", ".attend", function(event, data){
    $(this).replaceWith(data.attend_button);
  });
}

function friendUnattendListener(){
  $(".current-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
  });
}