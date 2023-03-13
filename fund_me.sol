// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


//import the link from github so that we don't have to write a bunch of codes

//Contract is to verify if the wallet has more usd than the rquired amount.
//1.Get the price from chainlink datafeed in usd
//2.convert it to the same format as the input 
//3.verify 

import "./priceConverter.sol";


contract fund_me
{
    using priceConverter for uint256;
    
    address[] public funder;
    mapping(address ==> uint256 ) public addresstoamountfunded;

    uint256 usd=50 * 1e18;

    function fund() public payable
    {
        //This require function works like conditional statement 
        require(msg.value.getconversion >= usd , "don't have enough eth");
        //msg.value is the global keyword that get the value of the function
        //in require comma(,) is separated to if and else
        funder.push(msg.sender);
        addresstoamountfunded(msg.sender) = msg.value;
    }

}
