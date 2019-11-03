pragma solidity 0.4.24;

import "./Ownable.sol";

contract MessageStore is Ownable{
    
    string private message;
    
    //como esto cambia valores, es neceario que los minadores verifiquen la transaccion
    function setMessage(string newMessage) public payable {
        require (msg.value == 3 ether);
        message = newMessage;
    }
    
    function getMessage() public view returns (string) { // view: no se almacenara ningun valor en el smart contract que por lo tanto requiera minar una transaccion dentro de un bloque
        return message;
    }

    //el balance siempre es retornado en way
    //el balance es cuanta plata tiene elde contrato
    function getBalance() public view returns (uint){
    	return address(this).balance;
    }
    
    function getBalanceInEther() public view returns(uint){
    	return getBalance() / 1e18;
    }
    
    function transfer(uint amount) public isOwner{
    	require(address(this).balance >= amount);
    	owner.transfer(amount); //todas las var de tipo address tienen el methodo transfer
    }

    function transferTo(uint amount, address to) public isOwner{
    	require(address(this).balance >= amount);
    	require(to != address(0)); //evitar cuentas vacias

    	to.transfer(amount);
    }
}