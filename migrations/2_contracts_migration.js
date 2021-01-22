const RichToken = artifacts.require("./richToken.sol");
const HackingRichToken = artifacts.require("./HackingRichToken.sol");

module.exports = function(deployer) {
    estimatedGas();

    deployer.deploy(RichToken);
    deployer.deploy(HackingRichToken);

}


async function estimatedGas(){
    console.log("estimated gas to deploy RichToken: ", await RichToken.new.estimateGas());
    console.log("estimated gas to deploy RichToken: ", await HackingRichToken.new.estimateGas());
}
