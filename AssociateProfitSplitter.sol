pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one; // 0xA1B9556D92c33669Dac521065eD009c842224119
        employee_two = _two; // 0xaC9C1feD0DAF7ee3C87F8401C3Fafd2B9BBFE9BE
        employee_three = _three; // 0x9c185f92D4acfFc65B7475E445ecEfaef5898c61
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        
        uint amount = (msg.value / 3);

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(msg.value - amount*3);
    }

    function() external payable {
        deposit();
    }
}