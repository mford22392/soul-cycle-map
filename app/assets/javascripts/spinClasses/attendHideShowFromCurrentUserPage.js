$(document).on("page:change", function(){
  unattendCurrentUserShowListener();
  attendFromFriendPanelListener();
  unattendFromFriendPanelListener();
});

//Current User:
function attendFromFriendPanelListener(){
  $(".friends-classes-container").on("ajax:success", ".attend", function(event, data){
    $(".no-classes-message").remove();
    $(".btn-block").remove();
    $(".list-of-classes").append(data.selected_class);
    $(this).replaceWith(data.attend_button);
  });
}

//Current User:
function unattendFromFriendPanelListener(){
  $(".friends-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
    $("." + data.spin_class_id).remove();
  });
}


//Current User:
function unattendCurrentUserShowListener(){
  $(".current-user-classes-container").on("ajax:success", ".unattend", function(event, data){
    // if there is only 1 on the list, remove it and add a child that says no classes
    if ($(this).parent().parent().children().length == 1) {
      $(this).parent().parent().parent().append( "<p class='no-classes-message'>No upcoming classes.<p>" );
      $(this).parent().parent().parent().append( "<a href='/studios' class='btn btn-default btn-lg btn-block'>Add a class now!</a>" );
      $(this).parent().remove();
      $(".other-attendees-" + data.spin_class_id).remove();
    }
    else {
      $(this).parent().remove();
    }
    var form = $(".friend-" + data.spin_class_id + " .unattend").first()[0];
    $(form).replaceWith(data.unattend_button);
  });
}
