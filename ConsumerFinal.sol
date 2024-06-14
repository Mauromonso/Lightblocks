// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IEOFeedManager {
    struct PriceFeed {
        uint256 value;
        uint256 timestamp;
    }
    function getLatestPriceFeed(uint16 symbol) external view returns (PriceFeed memory);
    function getLatestPriceFeeds(uint16[] calldata symbols) external view returns (PriceFeed[] memory);
    function isSupportedFeed( uint16 feedId) external view  returns (bool);
}

contract EOConsumerExample {
    IEOFeedManager private  _feedManager;

    mapping(uint16 => IEOFeedManager.PriceFeed[]) private dataFeeds;

    /**
     * Network: Holesky
     * FeedManager: 0x723BD409703EF60d6fB9F8d986eb90099A170fd0
     */
    constructor() {
        _feedManager = IEOFeedManager(0x723BD409703EF60d6fB9F8d986eb90099A170fd0);
    }
    function saveData(uint16 symbol) external {
        require(_feedManager.isSupportedFeed(symbol),"The Symbol is not a valid one");
       
        IEOFeedManager.PriceFeed memory data = getPrice(symbol); 
        uint256 value = data.value; 
        uint256 timestamp = data.timestamp; 

    dataFeeds[symbol].push(IEOFeedManager.PriceFeed({value: value, timestamp: timestamp}));

    }
   function deleteLastElement(uint16 symbol) external {
        require(dataFeeds[symbol].length > 0, "Array is empty");

        dataFeeds[symbol].pop();
    }
    // Example for using IEOFeedManager.getLatestPriceFeed with a single symbol.
    function getPrice(uint16 symbol) private view returns (IEOFeedManager.PriceFeed memory) {
        return _feedManager.getLatestPriceFeed(symbol); // 1 is the id for BTC:USD
    }
        
    function getData(uint16 symbol, uint256 index) external view returns (uint256) {
        require(index < dataFeeds[symbol].length , "Index does not exist");
        return dataFeeds[symbol][index].value;
    }
    
    function getTime(uint16 symbol, uint256 index) external view returns (uint256) {
        require(index < dataFeeds[symbol].length , "Index does not exist");
        return dataFeeds[symbol][index].timestamp;
    }

}