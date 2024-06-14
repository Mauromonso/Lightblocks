// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IEOFeedAdapter {
    function getPairSymbol() external view returns (uint16);
    function decimals() external view returns (uint8);
    function description() external view returns (string memory);
    function version() external view returns (uint256);

    // getRoundData and latestRoundData both raise "No data present"
    // if they do not have data to report, instead of returning unset values
    // which could be misinterpreted as actual reported values.
    function getRoundData(uint80 _roundId)
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}


contract EOCLConsumerExample {
    IEOFeedAdapter private _feedAdapter;
        int256[] private dataArray;
         int256 private answer;
        event DataAdded(uint256 indexedIndex, int256 value);
     /**
     * Network: Holesky
     * EOFeedAdapter: 0xDD8387185C9e0a173702fc4a3285FA576141A9cd
     * Feed Symbol: BTC 
     */
    constructor() {
        _feedAdapter = IEOFeedAdapter(0xDD8387185C9e0a173702fc4a3285FA576141A9cd);
    }
    function saveData() external {
        (, answer,,,) = _feedAdapter.latestRoundData();
        dataArray.push(answer);
        emit DataAdded(dataArray.length - 1, answer);
    }
    function deleteLastElement() external {
        require(dataArray.length > 0, "Array is empty");
        dataArray.pop();
    }

   /* function getPrice() private  view returns (int256 answer) {
        (, answer,,,) = _feedAdapter.latestRoundData();
                        
    }*/
    function getData(uint256 index) external view returns (int256) {
        require(index < dataArray.length, "Index does not exist");
        return dataArray[index];
    }

   /* function usePrice() public {
        int256 answer = getPrice();  
        // Do something 
        // .............
    }*/
}
