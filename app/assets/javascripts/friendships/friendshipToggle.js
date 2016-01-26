$(document).on("page:change", function(){
  addFriendListener();
  deleteFriendListener();
});

function addFriendListener(){
  $(".friendship-js").on("ajax:success", ".add-friend", function(event, data){
    $(".current-friends-table").append(data.friend_listing);
    $("#no-friends-message").remove();
    $("#search-message").remove();
    $(this).parent().parent().remove();
    deleteFriendListener();
  });
}

function deleteFriendListener(){
  $(".friendship-js").on("ajax:success", ".delete-friend", function(event, data){
    $("#no-users-message").remove();
    $(".search-table").append(data.friend_listing);
    $(this).parent().parent().remove();
    addFriendListener();
  });
}

