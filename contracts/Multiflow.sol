// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "../interfaces/IMultiflow.sol";
import "@opengsn/contracts/src/BaseRelayRecipient.sol";


/**
 * @title Central contract for the Multiflow project funds management
 */
contract Multiflow is IMultiflow, BaseRelayRecipient {
    /// @notice maps address of a voter to a project Id, which maps to a donation amount for that project
    mapping(address => mapping(uint256 => uint256)) public voters;

    /// @notice maps a project Id to a set of responsible workers
    mapping(uint256 => address[]) public workers;

    constructor() {}

    /**
     * @notice allows a voter to supply funds to a project
     * @dev emits a Funded event
     * @param _proposal the ID of the proposal to fund
     * @return a bool value representing success
     */
    function fundProposal(uint256 _proposal)
        external
        payable
        override
        returns (bool)
    {
        // record amount deposited by this voter
        voters[msg.sender][_proposal] += msg.value;

        // emit record
        emit Funded(msg.sender, msg.value, _proposal);

        return true;
    }

    /**
     * @notice Allows a voter to approve payout to a finished proposal
     * @dev emits an Approved event and pays workers
     * @param _proposal the ID of the proposal to approve
     * @return a bool value representing success
     */
    function approveCompletedProposal(uint256 _proposal)
        external
        override
        returns (bool)
    {
        // calculate total donation to this proposal
        uint256 funds = voters[msg.sender][_proposal];

        // split funds among workers and payout
        address[] memory workerAdresses = workers[_proposal];
        uint256 numWorkers = workerAdresses.length;
        uint256 fundPerWorker = funds / numWorkers;

        for (uint256 i = 0; i < numWorkers; i++) {
            _payout(workerAdresses[i], fundPerWorker);
        }

        // emit record
        emit Approved(msg.sender, _proposal, funds);

        return true;
    }

    /**
     * @notice A helper function handling the payout logic
     * @dev routes all payout logic
     * @param _to the address of the worker being paid
     * @param _amount the total value of the payment
     * @return success a bool value representing success of the payment
     */
    function _payout(address _to, uint256 _amount)
        internal
        returns (bool success)
    {
        address payable payTo = payable(_to); // solhint-disable-line

        success = payTo.send(_amount);
        return success;
    }
}
