$(function(){
  nextPagination()
  previousPagination()

});

function nextPagination(){
$('#next-page').on('click', function(e){
  debugger
  e.preventDefault()

    let leagueID = parseInt(this.dataset.id)
    let matchday = parseInt(this.dataset.matchday) + 1
    $('.matches-table').load(`/leagues/${leagueID}/matches/current?matchday=${matchday} 
    .matches-table`)
    this.dataset.matchday = parseInt(this.dataset.matchday) + 1
   
  })
};

function previousPagination(){
  $('#previous-page').on('click', function(e){
    e.preventDefault()
    
    let leagueID = parseInt(this.dataset.id)
    let matchday = parseInt(this.dataset.matchday) - 1
    $('.matches-table').load(`/leagues/${leagueID}/matches/current?matchday=${matchday} 
    .matches-table`)
    this.dataset.matchday = (this.dataset.matchday -1)
    
  })
  
};