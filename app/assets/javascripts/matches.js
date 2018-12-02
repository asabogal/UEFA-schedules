$(function(){
  getAllMatches()
  getScheduledMatches()
  showMatches()
})

  class Matches {
    constructor(){
      this.matches = []
    }

    renderMatchesTable(){
      const tableHTML = 
     `<table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="th-sm"><h3> Match</h3></th>
          <th class="th-sm"><h3> Score</h3></th>
          <th class="th-sm"><h3> Time(ET)</h3></th>
          <th class="th-sm"><h3> Status</h3></th>
        </tr>
        </thead>
        <tbody id="matches-rows">
      
        </tbody>
      </table>`
      const table = document.getElementById('js-table')
      table.innerHTML = tableHTML
    };
  
    renderMatchesRow(){
      let matchesRow = "";
      this.matches.map(match => { 
        matchesRow += `<tr>`
        matchesRow += `<td> <a href="/teams/${match.homeTeam.id}">${match.homeTeam.name}</a> vs. <a href="/teams/${match.awayTeam.id}">${match.awayTeam.name}</a> </td>`
        matchesRow += `<td>${match.score.fullTime.homeTeam} - ${match.score.fullTime.awayTeam} </td>`
        matchesRow += `<td>${match.utcDate} </td>`
        matchesRow += `<td>${match.status}</td>`
        matchesRow += `</tr>` });
  
      const tableBody = document.getElementById('matches-rows')
      tableBody.innerHTML = matchesRow
    }

  //end class
  };

  function getAllMatches(){
    $('#all-matches').on('click', function(e){
      e.preventDefault()
      let leagueId = $("#all-matches").attr("data-id")
      fetch(`/leagues/${leagueId}/matches/all.json`)
      .then(res => res.json())
      .then(matches => {
        const newMatches = new Matches()
        matches.forEach(match => newMatches.matches.push(match))
        newMatches.renderMatchesTable()
        newMatches.renderMatchesRow()
        $('.current-matches').empty()
      })
    })
  };

  function getScheduledMatches(){
    $('#scheduled-matches').on('click', function(e){
      e.preventDefault()
      let leagueId = $("#scheduled-matches").attr("data-id")
      fetch(`/leagues/${leagueId}/matches/scheduled.json`)
      .then(res => res.json())
      .then(matches => {
        const newMatches = new Matches()
        matches.forEach(match => newMatches.matches.push(match))
        newMatches.renderMatchesTable()
        newMatches.renderMatchesRow()
        $('.current-matches').empty()
      
      })
    })
  };



  //**BUILD -> class/instance method to format matchDate

//#getScheduledMatches
  //ajax get json request to .../scheduled.(json?)  
  ////instantiate match object to get matches array from response


 //#Match.prototype.tableHTML
// make table template and uses Matches class attributes to populate
//templeate

//#Match.renderAllMatches
//uses the above methods to append the return to the page div

//#Match.renderScheduledMatches
//uses the above methods to append the return to the page div


