/**
 * Simple helper to format price for the marketplace
 */
const ethers = require('ethers');

function formatPrice(ethAmount) {
    return ethers.parseEther(ethAmount.toString());
}

const examplePrice = 0.5; // 0.5 ETH
console.log("Listing price in Wei:", formatPrice(examplePrice).toString());
