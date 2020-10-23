pragma solidity >= 0.5.0 < 0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper {
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= level);
        _;
    }

    function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].name = _newName;
    }

    function changeDna(uint _zombieId, uint calldata _newDna) external aboveLevel(20, _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].dna = _newDna;
    }

    function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ownerZombieCount[_owner]);

        return result;
    }
}
 