// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "../interfaces/IVerifier.sol";
import "@chainlink/contracts/src/v0.5/dev/SchnorrSECP256K1.sol";

contract Verifier is IVerifier, SchnorrSECP256K1 {

    function verify() external returns(bool) {

        
        return true;
    }
}