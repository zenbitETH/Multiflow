import React from "react";

const Verification = () => {

return (
    <div className="project">
      <div className="project-id">
        <span role="img" aria-label="emoji">💡</span> 
        Project # 1 
        <div className="project-title">Do the government errands to build a pool on the vacant lot next to the park.</div>
      </div>
      <div className="project-info">
        made on 27/6/2021
        by 0xe953584537A08Db29e8CD7D53C20340640F08369
      </div>
      <div className="table-container">
        <div className="project-table">
          <div className="proposal-cell3"> <span role="img" aria-label="emoji">⚙️</span> Action: <div className="table-text">{}Public work</div></div>
          <div className="proposal-cell3"> <span role="img" aria-label="emoji">📍</span> Where: <div className="table-text">{}Santa Mónica 2</div></div>
        </div>
        <div className="project-description">
        It is proposed to build a pool on the vacant lot next to the park for water sports. To comply with this proposal, it is necessary to carry out the management with the State Government to verify its viability. The reward to whoever carries out this management is put to a future vote.
        </div>
        <div className="project-table">
          <div className="proposal-cell1">Initial Payout: <div className="table-text">{}0.005 eth</div></div>
          <div className="proposal-cell1">Current payout: <div className="table-text">0.0100 eth</div></div>
        </div>
        <div className="project-table">
          <div className="proposal-cell2">Current Workers: <div className="table-text">3</div></div>
          <div className="proposal-cell2">Payout per worker: <div className="table-text">0.0033 eth</div></div>
        </div>
      </div>

      <div className="table-container2">
        <div className="project-table2">
          <div className="proposal-cell3">Analog PoW:<div className="table-text2">Government ID process</div></div>
          <div className="proposal-cell3">Validations left: <div className="table-text2">2 of 5 required</div></div>
        </div>
        <div className="APow-button">
          Go to Validations
      </div>
      </div>
    
    </div>
)
}

export default Verification;