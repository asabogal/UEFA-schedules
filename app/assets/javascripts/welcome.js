
$(function(){
  showMatches()
  changeBtn()
})


let showMatches = () => {
  $('.btn.btn-primary.league-button').click(function(e){
    e.preventDefault()
      $('.current-matches').load(`/leagues/${this.dataset.id}/matches/current .matches-table`)
      $('#js-table').empty()
    });
};

let changeBtn = () => {
  $('.btn.btn-primary').click(function(){
    setTimeout(function(){ window.scrollTo(0, 1000);}, 1500 )
    $('.btn.btn-primary').removeClass("active");
    $(this).addClass("active");
    
  });
}

 