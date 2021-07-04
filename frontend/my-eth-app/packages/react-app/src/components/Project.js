import React from "react";

const Project = () => {

return (
    <div className="container">
    <div className="voter-side">Fund a project
      <div class="eth">
        <input type="number" id="number" placeholder="0.0000"></input>
      </div>
      <div className="fund-button">
          Deposit
      </div>
    </div>
    
    <div className="project">
      <div className="project-id">
        Project #ID
      </div>
      <div className="project-description">
      Description for the project taken from Votaro aproved proposals. Text to fill Text to fill Text to fill Text to fill Text to fill Text to fill Text to fill Text to fill Text to fill 
      </div>
      <div className="project-table">
        <div className="proposal-cell1">Total payout: <div className="table-text">0.0100 eth</div></div>
        <div className="proposal-cell2">Workers: <div className="table-text">1 of 3</div></div>
      </div>
    </div>
    
    <div className="work-button">
          Take this work
    </div>
    <div className="worker-side"> Complete the job</div>
  </div>
)
}

export default Project;