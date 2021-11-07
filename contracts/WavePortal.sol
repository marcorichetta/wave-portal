// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    // Variable de estado que se mantiene en el contrato
    // Inicializada en 0
    uint256 totalWaves;

    // Map de addresses y cantidad de saludos
    mapping(address => uint256) wavesBalance;

    constructor() {
        console.log(
            "Hola! Soy un Smart Contract no tan 'smart'. Mando saludos noma!"
        );
    }

    // Esta función es puede ser llamada por el mismo contrato o externamente
    function wave() public {
        totalWaves += 1;
        console.log("%s ha dejado un saludo!", msg.sender);

        wavesBalance[msg.sender]++;

        console.log(
            "Total de saludos de %s: %d",
            msg.sender,
            wavesBalance[msg.sender]
        );
    }

    // Esta función además "promete" no modificar el estado del contrato (view)
    function getTotalWaves() public view returns (uint256) {
        console.log("Tenemos un total de %d saludos!", totalWaves);
        return totalWaves;
    }
}
