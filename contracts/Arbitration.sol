pragma solidity ^0.4.11;

contract Arbitration {
  string public description;
  string public winningOpinion;

  struct Claimant {
    string opinion;
    address addr;
    address arbiter;
  }
  Claimant[] public claimants;

  function setDescription(string _description) {
    description = _description;
  }
  function addClaimant(string opinion, address arbiter) {
    if (claimants.length < 2) {
      claimants.push(Claimant(opinion, msg.sender, arbiter));
    }
  }

  function getProposals()
      returns (
        string _description,
        string _proposalOne,
        string _proposalTwo
      )
    {
      require(claimants.length == 2);
      return (
        description,
        claimants[0].opinion,
        claimants[1].opinion
      );
    }

  function verifyArbiter() returns (bool isArbiter) {
      for (uint i = 0; i < claimants.length; i++) {
        if (msg.sender != claimants[i].arbiter) {
          return false;
        }
      }
      return true;
    }
    function selectWinner(uint proposalNumber) {
      require(verifyArbiter());
      winningOpinion = claimants[proposalNumber].opinion;
    }
}
