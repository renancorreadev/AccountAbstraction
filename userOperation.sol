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
