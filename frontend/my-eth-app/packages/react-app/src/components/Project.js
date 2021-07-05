import React from "react";
import Verification from './Verification';

const Project = () => {

return (
    <div className="container">
    <div className="voter-side"> 💧 Fund a project 💧
      <div class="eth">
        <input type="number" id="number" placeholder="0.0000"></input>
      </div>
      <div className="fund-button">
          Deposit
      </div>
    </div>

    <Verification/>
    
    <div className="work-button">
          Take this work
    </div>
    <div className="worker-side"> ⚙️ Complete the job ⚙️</div>
  </div>
)
}

export default Project;