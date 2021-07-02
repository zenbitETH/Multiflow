// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

interface IMultiflow {
    function fundProposal(uint256 _proposal) external payable returns (bool);

    function approveCompletedProposal(uint256 _proposal)
        external
        returns (bool);

    event Funded(
        address depositer,
        uint256 proposalId,
        uint256 amountDeposited
    );

    event Approved(address voter, uint256 proposalId, uint256 payout);
}
