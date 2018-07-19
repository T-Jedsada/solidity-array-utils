pragma solidity ^0.4.16;

library List {

    struct Items {
        uint[] items;
    }

    function pushItem(Items storage data, uint value) public {
        data.items.push(value);
    }

    function popItem(Items storage data) public returns (uint[]) {
        delete data.items[data.items.length-1];
        data.items.length--;
        return data.items;
    }
    
    function getSize(Items storage data) public view returns (uint) {
        return data.items.length;
    }
}