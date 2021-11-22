// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.2;

 /**
  * @title ERC20 Token
  * @author AKA Exchange
  * @dev An ERC20 Token that is burnable, mintable, and has a max supply built
  * using openzeppelin contracts.
  */

 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";

 contract MyToken is ERC20, ERC20Burnable, Ownable {

     /**
      * @dev Set the max supply
      */
     uint256 private _maxSupply = 1000000000 * 18 ** decimals();

     constructor() ERC20("AKA Exchange - Ethereum", "AKAE") {
         /**
          * @dev Set the premint amount
          */
         _mint(msg.sender, 2500000 * 18 ** decimals());
     }

     /**
      * @dev Returns max supply of the token.
      */
      function getMaxSupply() public view returns (uint256) {
          return _maxSupply;
      }

     /**
      * @dev Only the owner will be able to mint tokens and ensures
      * total supply doesn't go beyond the max supply
      */
      function mint(address to, uint256 amount) public onlyOwner {
          /**
           * @dev Total Spply + Mint Amount should not exceed Max Supply
           */
          require(totalSupply() + amount <= getMaxSupply(), "Max Supply Exceeded");
          _mint(to, amount);
      }
 } 