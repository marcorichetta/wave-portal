const main = async () => {
	const [owner, randomAddress] = await hre.ethers.getSigners();

	// Usar hre para obtener un factory en base a nuestro contract en /contracts
	const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");

	// Hardhat crea una red local con 20 nodos para desplegar este contract
	const waveContract = await waveContractFactory.deploy();

	// Esperar hasta que esté desplegado
	await waveContract.deployed();

	console.log("Contrato desplegado a:", waveContract.address);
	console.log("Contrato desplegado por:", owner.address);

	// Obtener la cuenta de total de saludos
	let waveCount = await waveContract.getTotalWaves();

	// Enviar un saludo y obtener la cuenta nuevamente
	let waveTxn = await waveContract.wave();
	await waveTxn.wait();
	waveCount = await waveContract.getTotalWaves();

	// Lo mismo pero desde otra address
	// https://docs.ethers.io/v5/api/contract/contract/#Contract-connect
	waveTxn = await waveContract.connect(randomAddress).wave();
	await waveTxn.wait();
	waveCount = await waveContract.getTotalWaves();
};

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.log(error);
		process.exit(1);
	});
