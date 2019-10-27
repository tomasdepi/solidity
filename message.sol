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
    
    
}