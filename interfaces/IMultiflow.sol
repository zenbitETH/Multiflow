// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

interface IMultiflow {

    
    function fundProposal(uint _proposal) external payable returns(bool);
    
    function approveCompletedProposal(uint _proposal) external returns(bool);

    event Funded(
        address depositer,
        uint proposalId,
        uint amountDeposited
    );

    event Approved(
        address voter,
        uint proposalId,
        uint payout
    );
}