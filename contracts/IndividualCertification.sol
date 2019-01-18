pragma solidity ^0.4.24;

// File: contracts/IndividualCertification.sol

/**
  * @title   Individual Certification Contract
  * @author  Rosen GmbH
  *
  * This contract represents the individual certificate.
  */
contract IndividualCertification {
    address public registryAddress;
    bytes32 public b0;
    bytes32 public b1;

    constructor(bytes32 _b0, bytes32 _b1)
    public
    {
        registryAddress = msg.sender;
        b0 = _b0;
        b1 = _b1;
    }
    function updateHashValue(bytes32 _b0, bytes32 _b1)
    public
    {
        require(msg.sender == registryAddress);
        b0 = _b0;
        b1 = _b1;
    }

    function hashValue()
    public
    view
    returns (bytes32, bytes32)
    {
        return (b0, b1);
    }

    /**
  * Extinguish this certificate.
  *
  * This can be done by the same certifier contract which has created
  * the certificate in the first place only.
  */
    function deleteCertificate() public {
        require(msg.sender == registryAddress);
        selfdestruct(msg.sender);
    }
}