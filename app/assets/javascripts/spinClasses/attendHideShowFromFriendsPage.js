$(document).on("page:change", function(){
  friendAttendListener();
  friendUnattendListener();
  friendOfFriendAttendListener();
  friendOfFriendUnattendListener();
});


function friendAttendListener(){
  $(".user-classes-container").on("ajax:success", ".attend", function(event, data){
    $(this).replaceWith(data.attend_button);
  });
}

function friendUnattendListener(){
  $(".user-classes-container").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
  });
}

function friendOfFriendAttendListener(){
  $(".friends-classes-container-friend-page").on("ajax:success", ".attend", function(event, data){
    $(this).replaceWith(data.attend_button);
  });
}

function friendOfFriendUnattendListener(){
  $(".friends-classes-container-friend-page").on("ajax:success", ".unattend", function(event, data){
    $(this).replaceWith(data.unattend_button);
  });
}