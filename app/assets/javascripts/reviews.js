$(function(){

getReviews()
})

function getReviews(){
  $("#new_review").on('submit', function(e){
    e.preventDefault()
    let values = $(this).serialize()
    let posting = $.post('/reviews', values)
    posting.done(function(data){
      $('#review-list').prepend(renderData(data))
    })
  });

};

function renderData(data){
  console.log(data)

  let html = `<div class="review-container bg-light">
  <h1> Rating: ${data.rating} </h1>
  <p> Comment: ${data.comment} </p>
  <h5> Reviewer: ${data.reviewer} </h4>
  </div>`
  return html
};



// $.ajax({
//   type: "POST",
//   url: this.action,
//   data: $(this).serialize(),
//   success: function(response){
//     console.log(response)
//   }
// });
