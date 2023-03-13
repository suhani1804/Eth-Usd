// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//import the link from github so that we don't have to write a bunch of codes

//Contract is to verify if the wallet has more usd than the rquired amount.
//1.Get the price from chainlink datafeed in usd
//2.convert it to the same format as the input 
//3.verify 

uint256 usd=50 * 1e18;

contract fund_me
{

    function fund() public payable
    {
        //This require function works like conditional statement 
        require(getconversion(msg.value) >= usd , "don't have enough eth");
        //msg.value is the global keyword that get the value of the function
        //in require comma(,) is separated to if and else
    }

    function getprice() public view return (uint256)
    {
        //to get the price we have to use chainlink datafeed 
        //As to get the data from the outside of the contract we need two things
        //ABI and ADDRESS of the contract where we want to get the data
        //Address 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419

        AggregatorV3Interface price= AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (,int256 price,,,) = pricefeed.latestRoundData();
        return uint256(price * 1e18);

    }
    function getversion public view return (uint256)
    {
        //Instead of writing the whole code we call the AggregatorV3Interface to get the all the fuction in it 
        //This is the esy way to interract to the outside of the contract

        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        return pricefeed.version() ;
        //pricefeed.version will return what version the pricefeed at i.e the version of the contract address
    }

    function getconversion(ethAmount) public return (uint256) 
    {
        uint256 ethprice =getprice();
        uint256 ethAmountInUsd = (ethprice * ethAmount)/ 1e18;
        // ethAmount for every eth amount the value will be divided by 1e18
        return ethAmountInUsd;
    }
}
