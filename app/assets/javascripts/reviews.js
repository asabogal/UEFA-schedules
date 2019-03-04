$(function(){

getReviews()
})

class Review {
  constructor (data){
    this.rating = data.rating
    this.comment = data.comment
    this.reviewer = data.reviewer
  }
  
  renderHTML () {
    return `<div class="review-container bg-light">
    <div class="star-rating" data-score=${this.rating}></div><br>
    <p> ${this.comment} </p>
      <em> Reviewer: ${this.reviewer} </em>
    </div>
    <br></br`
  };

}


let getReviews = () => {
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

let setStars = () => {
  $('.star-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
        return $(this).attr('data-score');
    }
    });
  };  

