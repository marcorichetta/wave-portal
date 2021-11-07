const main = async () => {
	const [deployer] = await hre.ethers.getSigners();
	const accountBalance = await deployer.getBalance();

	console.log("Desplegando contratos con la cuenta: ", deployer.address);
	console.log("Balance de la cuenta: ", accountBalance.toString());

	const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
	const portal = await waveContractFactory.deploy();
	await portal.deployed();

	console.log("Dirección del WavePortal: ", portal.address);
};

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.log(error);
		process.exit(1);
	});
