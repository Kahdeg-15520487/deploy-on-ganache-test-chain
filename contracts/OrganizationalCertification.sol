pragma solidity ^0.4.24;

// File: contracts/OrganizationalCertification.sol

/**
  * @title   Certificate Contract
  * @author  Chainstep GmbH
  *
  * Each instance of this contract represents a single certificate.
  */
contract OrganizationalCertification  {

    /**
      * Address of certifier contract this certificate belongs to.
      */
    address public registryAddress;

    string public CompanyName;
    string public Norm;
    string public CertID;
    uint public issued;
    uint public expires;
    string public Scope;
    string public issuingBody;

    /**
      * Constructor.
      *
      * @param _CompanyName Name of company name the certificate is issued to.
      * @param _Norm The norm.
      * @param _CertID Unique identifier of the certificate.
      * @param _issued Timestamp (Unix epoch) when the certificate was issued.
      * @param _expires Timestamp (Unix epoch) when the certificate will expire.
      * @param _Scope The scope of the certificate.
      * @param _issuingBody The issuer of the certificate.
      */
    constructor(
        string memory _CompanyName,
        string memory _Norm,
        string memory _CertID,
        uint _issued,
        uint _expires,
        string memory _Scope,
        string memory _issuingBody)
        public
    {
        require(_issued < _expires);

        registryAddress = msg.sender;

        CompanyName = _CompanyName;
        Norm =_Norm;
        CertID = _CertID;
        issued = _issued;
        expires = _expires;
        Scope = _Scope;
        issuingBody = _issuingBody;
    }

    /**
      * Extinguish this certificate.
      *
      * This can be done the same certifier contract which has created
      * the certificate in the first place only.
      */
    function deleteCertificate() public {
        require(msg.sender == registryAddress);
        selfdestruct(tx.origin);
    }

}