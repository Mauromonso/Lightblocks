# Home Assignment for Support Manager Role at lightblocks

As part of the hiring process, I have been requested to complete a home assignment. It consists of two parts which I have solved.
By Mauro Monso - 14th June 2024
Assignment Details:
https://phase-fir-c8f.notion.site/Support-Home-Assignment-3199b1db9e4648198bce354860460c2c
Github Repository:
https://github.com/Mauromonso/Lightblocks 
# Task 1 - Operator

The goal here is to simulate an operator. You should think as an operator that operates many external software and one of those is our data validator client.

You need to setup an operator for Eoracle data validator on Holesky.

Once you setup your operator on EigenLayer, you can complete your setup and register your operator to eoracle.

Here is your starting point https://eoracle.gitbook.io/eoracle/eoracle-operator-guide

## Goals

- You should be able to register your operator to Eigen Layer and to eoracle AVS
- You should be able to startup a data validator and run it for at least 1 hour without any error

Tip: You need to contact lightblocks in order to complete this task

## Expected output

- Feedback on the setup process
- Feedback on running the data validator

# Task 2 - Data Consumer

The goal here is to simulate a data consumers (dapps, protocols). You should think as a dapp, protocol developer who needs to consume data.

You need to setup a smart contract on Holesky that will consume data from eoracle and save it onchain (in the smart contract) using an array/list variable.

The documentation we have on this section are very raw, which you may need to do some trial and errors. For any missing information please send an email to [hr@lightblocks.org](mailto:hr@lightblocks.org)

Here is your starting point https://eoracle.gitbook.io/sdk-documentation/

## Goals

- You should have a smart contract that consume 2 different data feeds from eoracle on Holesky
- The smart contract should be able to return the data collected from eoracle based on their collecting time. The smart contract must have the following functions (it can contain more functions)
    - function getData(uint16 symbol, uint16 index) return uint256 - this function returns the value of the feed based on the index. if the index doesn’t exist, the function should revert with a meaningful error
    - function saveData(uint16 symbol) - this function gets the data from eoracle contract and save it in an array in your smart contract

## Expected output

- Feedback on the implementation process
- Feedback on the documentation
- The smart contract address you set in Holesky
- Running at least 4 transactions per data feed that consumes data
- The code of your smart contract


# Solution
The solution report is available [here](https://docs.google.com/document/d/17MLMz7zjKy1-J9iHSDH0sZQIZi4EEbjhKPUVdg9hJbU/edit#heading=h.58cr6xbhv7sw) in this Google Docs.
