// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;

    function setUp() external {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testNFTNameIsCorrect() public view {
        string memory expectedName = "Dogo";
        string memory actualName = basicNFT.name();

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

}