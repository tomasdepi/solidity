pragma solidity 0.4.24;

contract MessageStore{
    
    address private owner;
    string private message;
    
    constructor() public{
        owner = msg.sender; // msg.sender es el que ejecuta la transaccion dentro de la red
    }
    
    //como esto cambia valores, es neceario que los minadores verifiquen la transaccion
    function setMessage(string newMessage) public {
        message = newMessage;
    }
    
    function getMessage() public view returns (string) { // view: no se almacenara ningun valor en el smart contract que por lo tanto requiera minar una transaccion dentro de un bloque
        return message;
    }
    
