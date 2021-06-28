// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "../interfaces/IMultiflow.sol";

contract Multiflow is IMultiflow {

    struct Voter {
        uint depositedFunds,
    }

    map(address => Voter) voters;
    address[] workers;

    constructor() {
    }

    function deposit() external payable returns(bool success) {

        voters[msg.sender].depositedFunds += msg.value;

        emit Deposited(
            msg.sender,
            msg.value,
        );

        return true;
    }

    function vote() external returns(bool success) {

        uint funds = voters[msg.sender].depositedFunds;

        fundPerWorker = funds / workers.length;

        for(int i = 0; i < workers.length; i++){
            _payout(workers[i], fundPerWorker);
        }

        return true;
    }

    function _payout(address _to, uint _amount) internal returns(bool success) {

        payable address to = payable(_to);

        to.send(_amount);

        return true;
    }

    event Deposited(
        address Depositer,
        uint Amount,
    );

    event Voted(
        address voter,
        uint payout,
    );
}