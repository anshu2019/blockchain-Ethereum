

pragma solidity 0.4.25;

contract MyBank {

    mapping(address => uint256) private accountBalanceOf;   // balances, indexed by addresses
    address private user;
    
    constructor() public payable {
         //This is the contract constructor
         user = msg.sender;
         
    }
    
    //This function deposits money for user
    //before the deposit is done , amount attached with transaction is validated
    function deposit(uint256 amount) public payable {
        require(msg.value == amount,
        "Error :Amount value not attached with transaction for deposit, please attach money");
        
        accountBalanceOf[msg.sender] += amount;     // adjust the account's balance
    }
    
  
    //This function withdraws money for user
    //before the withdrawal is done , sufficient balance is validated
    function withdraw(uint256 amount) public {
        require(amount <= accountBalanceOf[msg.sender],
        "Error : You do not have sufficient balance for requested amount.");
        accountBalanceOf[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
    
    //This method shows the current balance of a user.
    function getBalance() public view returns (uint256) {
        return accountBalanceOf[msg.sender];
    }
}