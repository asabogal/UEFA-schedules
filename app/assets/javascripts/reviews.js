$(function(){

getReviews()
})

class Review {
  constructor (data){
    this.rating = data.rating
    this.comment = data.comment
    this.reviewer = data.reviewer
  }
}

Review.prototype.renderHTML = function(){
  return `<div class="review-container bg-light">
  <div class="star-rating" data-score=${this.rating}></div><br>
  <p> ${this.comment} </p>
    <em> Reviewer: ${this.reviewer} </em>
  </div>
  <br></br`
};

function getReviews(){
  $("#new_review").on('submit', function(e){
    e.preventDefault()
    let values = $(this).serialize()
    let posting = $.post('/reviews', values)
    posting.done(function(data){

      const newReview = new Review(data)
      const reviewHTML = newReview.renderHTML()
      $('#review-list').prepend(reviewHTML)
      setStars()
    })
  });

};

// function renderData(data){

//   let html = `<div class="review-container bg-light">
//   <div class="star-rating" data-score=${data.rating}></div><br>
//   <p> ${data.comment} </p>
//     <em> Reviewer: ${data.reviewer} </em>
//   </div>
//   <br></br`
//   return html
// };

function setStars(){
  $('.star-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
        return $(this).attr('data-score');
    }
    });
  };  

 



// $.ajax({
//   type: "POST",
//   url: this.action,
//   data: $(this).serialize(),
//   success: function(response){
//     console.log(response)
//   }
// });
