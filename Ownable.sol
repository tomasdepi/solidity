pragma solidity 0.4.24;

contract Ownable {
    
    address private owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    // modifier son como decoradores para agregar funcionalidad a los metodoss
    modifier isOwner() {
        require (owner == msg.sender); // este modifier hace que solo el creador del smart contract pueda llamar al metodo
        _; // esta linea funciona como placeholder, solidity luego pone aqui el contenido del metodo que estamos decorando
    }
    
}