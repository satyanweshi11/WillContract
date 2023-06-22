// SPDX-License-Identifier: MIT

//types of data types in solidity UINT, STRING, BOOL, ADDRESS

pragma solidity >=0.8.2 <0.9.0;  //declare the version of the compiler to be used

contract Will{              //declaring a contract named Will 

    //variable declaration

    address owner;   //address data type is used to store address of wallets
    uint fortune;       //money amount
    bool isDead;        //is the grandfather dead or not


    //constructor initialize the value of the variables
    constructor() payable  {
        owner = msg.sender;
        fortune = msg.value;
        isDead = false;
    }

    //dynamic when used with a function checks a condition if true then only function will be called
    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

    modifier mustBeDeceased {
        require(isDead == true);
        _;
    }

    address payable[] familyWallets;   //array declaration for address

    mapping (address => uint) inheritance; //mapping each address with a integer amount

    function setInheritance( address payable wallet, uint amount) public onlyOwner{
        familyWallets.push(wallet);
        inheritance[wallet]=amount;
    }

    function payout() private mustBeDeceased {
        uint i;
        for(i=0; i<familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

    function deceased() public onlyOwner {
        isDead = true;
        payout();
    }
}