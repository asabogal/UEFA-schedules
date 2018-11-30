$(function(){

getReviews()
})

function getReviews(){
  $("#new_review").on('submit', function(e){
    e.preventDefault()

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        console.log(response)
      }
    });
   
  });

};
