const ethers = require("ethers");
const contractABI = require("./Counter.abi.json");
require("dotenv").config();

const provider = new ethers.providers.JsonRpcProvider(process.env.ETH_RPC_URL);
const signer = provider.getSigner(process.env.ETH_FROM);

const run = async () => {
    const counterContract = new ethers.Contract(
        process.env.DEPLOYED_CONTRACT,
        contractABI,
        signer
    );
    let count = await counterContract.getCounter();
    console.log("Current count :: ", count.toNumber());
}

const main = async () => {
    try {
        await run();
    } catch (err) {
        console.log(err);
    }
}

main();