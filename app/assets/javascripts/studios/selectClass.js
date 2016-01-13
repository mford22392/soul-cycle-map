$(document).on("page:change", function(){
  selectListener();
});



function selectListener(){
  $(".selected-class").on("ajax:success", function(event, data){
    $(".selected-day-container").html(data.selected_day);
    $(".selected-classes-container").children().remove();
    for (i = 0; i < data.selected_classes.length; i++) { 
      $(".selected-classes-container").append(data.selected_classes[i])
    }
  });
}
