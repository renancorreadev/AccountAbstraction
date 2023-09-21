struct UserOperation {
    // normal txs
    uint256 nonce;
    bytes callData;
    uint256 callGasLimit;
    uint256 maxFeePerGas;
    uint256 maxPriorityFeePerGas;
    bytes signature;
    // extra  txs fields
    address sender;
    bytes initCode;
    uint256 verificationGasLimit;
    uint256 preVerificationGas;
    bytes paymasterAndData;
}

interface IWallet {
    function validateUser0p(
        UserOperation memory user0p,
        bytes32 requestId,
        address aggregator,
        uint256 missingWalletFunds
    ) external returns (bool);

    function nonce () external view returns (uint256);
    function execFromEntryPoint (address dest, uint256 value,bytes calldata func) external;
}
