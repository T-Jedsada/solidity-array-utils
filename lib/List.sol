pragma solidity ^0.4.16;

library List {

    struct Items {
        uint[] items;
    }

    function addItem(Items storage data, uint value) public {
        data.items.push(value);
    }

    function removeItem(Items storage data) public returns (uint[]) {
        delete data.items[data.items.length-1];
        data.items.length--;
        return data.items;
    }

    function removeItem(Items storage data, uint index) public returns (uint[]) {
        delete data.items[index];
        data.items.length--;
        return data.items;
    }

    function findItem(Items storage data, uint value) public returns (uint) {
        for (var index=0; index < data.items.length; index++) {
            if (data.items[index] == value) {
                return index;
            }
        }
    }
    
    function getSize(Items storage data) public view returns (uint) {
        return data.items.length;
    }
}