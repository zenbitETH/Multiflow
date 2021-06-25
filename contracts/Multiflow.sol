// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "../interfaces/IMultiflow.sol";
import "../interfaces/IVerifier.sol";

contract Multiflow is IMultiflow {

    IVerifier verifier;

    constructor(address _verifier) {

        verifier = IVerifier(verifier);
    }

    function _payout() returns(bool success) {

        return true;
    }

    function _verifyVotes() returns(bool) {

        return true;
    }

    event VotePassed(
    );
}