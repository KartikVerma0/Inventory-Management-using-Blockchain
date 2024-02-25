// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

contract Inventory{
    //Items Information
    struct Items{
        uint256 ItemID;
        string ItemName;
        uint256 ItemQuantity;
        uint256 ItemPrice;
    }

    Items[] public ItemsInInventory; //Inventory`s Array


    //Function to add Items in Inventory Array.
    //Enter Item ID, Item Name, Item Quantity, Item Price as arguments.
    function addItem(uint _itemID, string memory _itemName, uint256 _itemQuantity, uint256 _itemPrice) public{
        ItemsInInventory.push(Items(_itemID, _itemName,_itemQuantity,_itemPrice));
    }

    //Function to sell Items from Inventory Array.
    //Enter Item ID, Item Quantity as arguments.
    function sellItem(uint _itemID, uint256 _itemQuantity) public{
        for (uint256 i=0;i<ItemsInInventory.length;i++){
            if (ItemsInInventory[i].ItemID==_itemID){
                uint256 itemQuantityAlreadyInStock = ItemsInInventory[i].ItemQuantity;
                ItemsInInventory[i].ItemQuantity=itemQuantityAlreadyInStock-_itemQuantity;
            }
        }
    }

    //Function to edit information of Items in Inventory Array.
    //Enter Item ID, Item Name, Item Quantity, Item Price as arguments.
    function editItem(uint _itemID, string memory _itemName, uint256 _itemQuantity, uint256 _itemPrice) public {
        for (uint256 j=0;j<ItemsInInventory.length;j++){
            if (ItemsInInventory[j].ItemID==_itemID){
                ItemsInInventory[j].ItemName = _itemName;
                ItemsInInventory[j].ItemQuantity = _itemQuantity;
                ItemsInInventory[j].ItemPrice = _itemPrice;
            }
        }
        
    }

    //Function to display information of Items in Inventory Array.
    //Enter Item ID as arguments.
    function displayItem(uint256 _itemID) public view returns (uint256,string memory,uint256,uint256){
        for (uint256 k=0;k<ItemsInInventory.length;k++){
            if (ItemsInInventory[k].ItemID==_itemID){
                return (ItemsInInventory[k].ItemID, ItemsInInventory[k].ItemName, ItemsInInventory[k].ItemQuantity, ItemsInInventory[k].ItemPrice);
            }
        }
        
    }

    //Function to display Items who are out of stock.
    function OutOfStockItems() public view returns (uint256, string memory){
        for (uint256 l=0;l<ItemsInInventory.length;l++){
            if (ItemsInInventory[l].ItemQuantity==0){
                return (ItemsInInventory[l].ItemID, ItemsInInventory[l].ItemName);
            }
        }
    }
}