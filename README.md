# Saludame en la blockchain 👋

Este proyecto es parte del curso _Build + deploy your first web3 app on Ethereum with Solidity + Smart Contracts_ de https://buildspace.so/.

La idea es

-   entender como funciona un smart contract (SC) _(muy poco smart)_
-   conocer el tooling existente y contrastar con herramientas de desarrollo convencional

## Setup

-   Instalar y compilar SC

```bash
yarn install
yarn hardhat compile
```

-   Correr SC en entorno de Hardhat

```bash
yarn hardhat run scripts/run.js
```

-   Correr red de Hardhat local y desplegar nuestro SC ahí

```bash
# Terminal 1
npx hardhat node

# Terminal 2
npx hardhat run scripts/deploy.js --network localhost
```
