$(function(){
  nextPagination()
  previousPagination()

});

function nextPagination(){
$('.page-link.next').on('click', function(e){
  e.preventDefault()

    let leagueID = parseInt(this.dataset.id)
    let matchday = parseInt(this.dataset.matchday) + 1
    $('.matches-table').load(`/leagues/${leagueID}/matches/current?matchday=${matchday} 
    .matches-table`)
    this.dataset.matchday = parseInt(this.dataset.matchday) + 1
   
  })
};

function previousPagination(){
  $('.page-link.previous').on('click', function(e){
    e.preventDefault()
    
    let leagueID = parseInt(this.dataset.id)
    let matchday = parseInt(this.dataset.matchday) - 1
    $('.matches-table').load(`/leagues/${leagueID}/matches/current?matchday=${matchday} 
    .matches-table`)
    this.dataset.matchday = (this.dataset.matchday -1)
    
  })
  
};