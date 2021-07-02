// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;
pragma experimental ABIEncoderV2;


import "@opengsn/contracts/src/BasePaymaster.sol";
import "@opengsn/contracts/src/forwarder/IForwarder.sol";


/**
 * @title The GSN Paymaster for Multiflow
 * @dev **NOT READY FOR PRODUCTION** can be DDoSed with current implementation
 */
contract MultiflowPaymaster is BasePaymaster {

    /// @notice contract only works for Multiflow
    address public Multiflow;

    /**
     * @notice Sets the contract this paymaster will call for
     * @param _multiflow the contract address for the Multiflow funds manager
     */
    constructor(address _multiflow) {
        Multiflow = _multiflow;
    }

    /**
     * @notice called before the request is relayed to Multiflow
     * @param relayRequest struct containing data about the call request. See: @opengsn/contracts/src/utils/GsnTypes.sol
     * @param signature used to validate the relayRequest value
     * @param approvaldata can be used for future logic on approving requests, sent by the relay
     * @param maxPossibleGas can be used to calculate total cost of the call
     * @return (bytes memory context, bool) forwards call to Multiflow on success, returns false on failure
     */
	function preRelayedCall(
		GsnTypes.RelayRequest calldata relayRequest,
		bytes calldata signature,
		bytes calldata approvalData,
		uint256 maxPossibleGas
	) external override
	returns (bytes memory context, bool) {
		_verifyForwarder(relayRequest);
		(signature, approvalData, maxPossibleGas);
		
		require(relayRequest.request.to == _multiflow);
        return (abi.encode(now), false);
	}

    
    /**
     * @notice Routes through Forwarder to Multiflow
     * @param context data needed to process request
     * @param success whether the relay was successful
     * @param gasUseWithoutPost gas used before the post-relay call
     * @param relayData struct containing data about the request. See: @opengsn/contracts/src/utils/GsnTypes.sol
     */
	function postRelayedCall(
		bytes calldata context,
		bool success,
		uint256 gasUseWithoutPost,
		GsnTypes.RelayData calldata relayData
	) external override  {
        (context, success, gasUseWithoutPost, relayData);
	}

}