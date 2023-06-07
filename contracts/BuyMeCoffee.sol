// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BuyMeCoffee {
    address payable owner;
    IERC20 public token;

    struct Memo {
        address from;
        uint256 time;
        string name;
        string message;
        uint value;
    }

    event newMemo(
        address from,
        uint timme,
        string name,
        string message,
        uint value
    );

    Memo[] memos;

    constructor(address tokenAdd) {
        token = IERC20(tokenAdd);
        owner = payable(msg.sender);
    }

    function getMemo() public view returns (Memo[] memory) {
        return memos;
    }

    function buyCoffee(
        string memory _name,
        string memory _message,
        uint value
    ) external {
        token.transferFrom(msg.sender, address(this), value);
        memos.push(Memo(msg.sender, block.timestamp, _name, _message, value));
        emit newMemo(msg.sender, block.timestamp, _name, _message, value);
    }

    function withDrawTips() public {
        require(msg.sender == owner, "You are not allowed to withdraw");
        uint val = token.balanceOf(address(this));
        token.transfer(msg.sender, val);
    }
}
