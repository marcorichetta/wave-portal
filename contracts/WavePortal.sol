// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    // Variable de estado que se mantiene en el contrato
    // Inicializada en 0
    uint256 totalWaves;

    // Map de addresses y cantidad de saludos
    mapping(address => uint256) wavesBalance;

    // Array global donde se almacenan todos los saludos
    Wave[] waves;

    /// @notice Evento emitido cuando se realiza un nuevo saludo
    /// @dev @param from es indexada como topic. Los topics nos permiten buscar eventos, por ejemplo.
    /// https://docs.soliditylang.org/en/latest/contracts.html#events
    /// @param from Address que envía el saludo.
    /// @param message Mensaje adjunto al saludo
    /// @param timestamp Momento en el que se envía el saludo
    event NewWave(address indexed from, string message, uint256 timestamp);

    /** 
        Estructura de datos custom
     */
    struct Wave {
        address waver; // Quien saluda
        string message; // Mensaje
        uint256 timestamp; // Cuando saludó
    }

    constructor() {
        console.log(
            "Hola! Soy un Smart Contract no tan 'smart'. Mando saludos noma!"
        );
    }

    // Esta función es puede ser llamada por el mismo contrato o externamente
    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s ha dejado un saludo!", msg.sender, _message);

        // Agregar el saludo a la lista
        waves.push(Wave(msg.sender, _message, block.timestamp));

        wavesBalance[msg.sender]++;

        console.log(
            "Total de saludos de %s: %d",
            msg.sender,
            wavesBalance[msg.sender]
        );

        emit NewWave(msg.sender, _message, block.timestamp);
    }

    /// @notice Retorna todos los saludos del contrato
    /// @dev No modifica el estado del contrato
    /// @return Wave
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    // Esta función además "promete" no modificar el estado del contrato (view)
    function getTotalWaves() public view returns (uint256) {
        console.log("Tenemos un total de %d saludos!", totalWaves);
        return totalWaves;
    }
}
