
$(function(){
  showMatches()
})


function showMatches(){
  $('.btn.btn-primary.league-button').on('click', function(e){
    e.preventDefault()
      $('.current-matches').load(`/leagues/${this.dataset.id}/matches/current .matches-table`)
    });
};


// function showMatches(){
//   $('.btn.btn-primary.league-button').on('click', function(e){
//     e.preventDefault()
//       $.ajax({
//         method: `GET`,
//         url: `http://localhost:3000/leagues/${this.dataset.id}/matches/next.json`,
//       }).done(function(resp){
//         console.log(resp)
//       })
//     });
// };



      