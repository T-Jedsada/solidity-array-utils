pragma solidity ^0.4.16;

library List {

    modifier restricted(Items storage data) {
        require(data.items.length > 0);
        _;
    }

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

    function findItem(Items storage data, uint value) public restricted(data) returns (uint) {
        for (uint index = 0; index < data.items.length; index++) {
            if (data.items[index] == value) {
                return index;
            }
        }
    }

    function sort(Items storage data) public returns (uint[]) {
        uint length = data.items.length;
        uint[] memory arr = new uint[] (length);

        for (uint index = 0; i < length; index++) {
            arr[i] = data.items[i];
        }

        for (uint i = 0; i < length; i++) {
            for (uint j = i + 1; j < length; j++) {
                if (arr[i] < arr[j]) {
                    uint temp = arr[j];
                    arr[j] = arr[i];
                    arr[i] = temp;
                }
            }   
        }

        return arr;
    }
    
    function getSize(Items storage data) public view returns (uint) {
        return data.items.length;
    }
}