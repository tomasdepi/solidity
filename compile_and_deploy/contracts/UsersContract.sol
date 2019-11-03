pragma solidity 0.4.24;

contract UsersContract {

    struct User{
        string name;
        string surname;
    }

    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    address[] joinedAddresses;

    event onUserJoin(address, string);

    function join(string name, string surname) public{
        require(!userJoined(msg.sender), "user already joined");
        User storage user = users[msg.sender];
        user.name = name;
        user.surname = surname;

        joinedAddresses.push(msg.sender);
        joinedUsers[msg.sender] = true;

        onUserJoin(msg.sender, string(abi.encodePacked(name, " ", surname)));
    }

    function getUser(address addr) public view returns (string, string){
        require(userJoined(addr), "user has not joined");
        User memory user = users[addr];
        return (user.name, user.surname);

        //return (users[addr].name, users[addr].surname);
    }

    function userJoined(address addr) private view returns (bool){
        return joinedUsers[addr];
    }

    function countTotalJoinedUsers() public view returns (uint){
        return joinedAddresses.length;
    }
}