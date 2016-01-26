$(document).on("page:change", function(){
  selectListener();
});



function selectListener(){
  $(".selected-classes-container").hide();
  $(".selected-class").on("ajax:success", function(event, data){
    $(".selected-classes-container").show();
    $(".selected-day-container").html(data.selected_day);
    $(".selected-classes-container").children().remove();
    for (i = 0; i < data.selected_classes.length; i++) { 
      $(".selected-classes-container").append(data.selected_classes[i])
    }
  });
}
