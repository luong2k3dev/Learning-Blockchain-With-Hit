// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Auction {
    // Data

    // Structure to hold details of Bidder
    struct IBidder {
        uint8 token;
        uint8 deposit;
    }

    // Structure to hold details of Rule
    struct IRule {
        uint8 startingPrice;
        uint8 minimumStep;
    }

    // State Enum to define Auction's state
    enum State {
        CREATED,
        STARTED,
        CLOSING,
        CLOSED
    }

    State public state = State.CREATED; // State of Auction

    uint8 public announcementTimes = 0; // Number of announcements
    uint8 public currentPrice = 0; // Latest price is bid.
    IRule public rule; // Rule of this session
    address public currentWinner; // Current Winner, who bid the highest price.
    address public auctioneer;

    uint16 public totalDeposit = 0;

    mapping(address => IBidder) public bidders; // Mapping to hold bidders' information

    constructor(uint8 _startingPrice, uint8 _minimumStep) {
        // Task #1 - Initialize the Smart contract
        // + Initialize Auctioneer with address of smart contract's owner
        // + Set the starting price & minimumStep
        // + Set the current price as the Starting price

        auctioneer = msg.sender;
        rule = IRule(_startingPrice, _minimumStep);
        currentPrice = _startingPrice;
    }

    // Modifier to check if the action can be done in current State
    modifier onlyState(State _state) {
        require(state == _state, "Invalid State!");
        _;
    }

    // Modifier to check if the current user do the action is bidder
    modifier onlyBidder() {
        require(bidders[msg.sender].token > 0, "Invalid User!");
        _;
    }

    // Modifier to check the person do the action is admin
    modifier onlyAdmin() {
        require(msg.sender == auctioneer, "Don't have permission to do this action, must be admin!");
        _;
    }

    // Register new Bidder
    function register(address _account, uint8 _token) public onlyState(State.CREATED) onlyAdmin() {
        // Task #2 - Register the bidder
        // + Initialize a Bidder with address and token are given.
        // + Initialize a Bidder's deposit with 0

        bidders[_account].token = _token;
        bidders[_account].deposit = 0;
    }

    // Start the session.
    function startSession() public onlyState(State.CREATED) onlyAdmin() {
        state = State.STARTED;
    }

    function bid(uint8 _price) public onlyState(State.STARTED) onlyBidder()  {
        // Task #3 - Bid by Bidders
        // + Check the price with currentPrice and minimumStep. Revert if invalid.
        // + Check if the Bidder has enough token to bid. Revert if invalid.
        // + Move token to

        address bidderAddr = msg.sender;
        IBidder storage currentBidder = bidders[bidderAddr];

        /* Start code here */
        require(_price >= currentPrice + rule.minimumStep, "Price should be more than current price + minimum step!");
        require(currentBidder.token >= _price, "The bidder should have enough token to bid!");

        currentBidder.token -= _price;
        currentBidder.deposit += _price;
        /* End code here */

        // Tracking deposit
        totalDeposit += _price;

        // Update the price and the winner after this bid.
        currentPrice = _price;
        currentWinner = bidderAddr;

        // Reset the Annoucements Counter
        announcementTimes = 0;
    }

    function announce() public onlyState(State.STARTED) onlyAdmin() {
        // Task #4 - Handle announcement.
        // + When Auctioneer annouce, increase the counter.
        // + When Auctioneer annouced more than 3 times, switch session to Closing state

        announcementTimes += 1;
        if (announcementTimes >= 3) state = State.CLOSING;
    }

    function getDeposit() public onlyState(State.CLOSING) onlyBidder() {
        // Task #5 - Handle get Deposit.
        // + Allow bidders (except Winner) to withdraw their deposit
        // + When all bidders' deposit are withdrew, close the session

        require(bidders[msg.sender].deposit > 0, "No more deposit!");
        require(msg.sender != currentWinner, "The winner cannot withdraw deposit!");

        uint8 deposit = bidders[msg.sender].deposit;
        totalDeposit -= deposit;
        bidders[msg.sender].deposit -= deposit;
        bidders[msg.sender].token += deposit;

        if (totalDeposit <= bidders[currentWinner].deposit) {
            state = State.CLOSED;
        }
    }
}