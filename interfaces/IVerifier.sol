// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

interface IMultiflow {

    function deposit() external returns(bool success);

    function verify() external returns(bool);
}