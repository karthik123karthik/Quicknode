// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
//contract address: 0xF973E9C553919Ef469f09ee6d07AC67F9489ECC8

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyBestFriendNFT is ERC721{
     address public owner;
     uint tokenId;
     constructor(address _owner)ERC721("MYFRIENDNFT","FRD"){
        _mint(msg.sender , tokenId);
        owner = _owner;
        setApprovalForAll(address(this), true);
     }
     
     // only I have perission to carry out the operations
     modifier onlyOwner{
          require(msg.sender == owner , "you are not the owner of the contract");
          _;
     }

     // make a friend by transferring nft
     function makeFriend(address _friend)public onlyOwner{
         uint balance = ERC721(address(this)).balanceOf(owner);
         require( balance > 0, "you donot have a proper balance");
         require(_friend!= address(0), "please enter the correct address");
         safeTransferFrom(owner, _friend, tokenId);                
     }

     //minting more nft when required
     function mintNft()public onlyOwner{
            tokenId++;
           _safeMint(msg.sender, tokenId);
     }
}
