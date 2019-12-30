pragma solidity ^0.5.2;


contract IDelegationManager {
  event DelStaked(address indexed user, uint256 indexed delegatorId, uint256 indexed activatonEpoch, uint256 amount, uint256 total);
  event DelUnstaked(address indexed user, uint256 indexed delegatorId, uint256 amount, uint256 total);
  event DelUnstakeInit(address indexed user, uint256 indexed delegatorId, uint256 indexed deactivationEpoch);
  event DelStakeUpdate(uint256 indexed delegatorId, uint256 indexed oldAmount, uint256 indexed newAmount);
  event Bonding(uint256 indexed delegatorId, uint256 indexed validatorId, uint256 indexed amount);
  event UnBonding(uint256 indexed delegatorId, uint256 indexed validatorId, uint256 indexed amount);
  event UpdateCommission(uint256 indexed validatorId, uint256 indexed rate);
  event ReBonding(uint256 indexed delegatorId, uint256 indexed oldValidatorId, uint256 indexed newValidatorId);
  event DelReStaked(uint256 indexed delegatorId, uint256 indexed amount, uint256 total);


  function stake(uint256 amount, uint256 validatorId) public;
  function slash(uint256[] memory _delegators, uint256 slashRate) public;
  function reStake(uint256 delegatorId, uint256 amount, bool stakeRewards) public;
  function unstake(uint256 delegatorId) public;
  function unstakeClaim(
    uint256 delegatorId,
    uint256 rewardAmount,
    uint256 slashedAmount,
    uint256 accIndex,
    bytes memory accProof) public;

  function claimRewards(
    uint256 delegatorId,
    uint256 rewardAmount,
    uint256 slashedAmount,
    uint256 accIndex,
    bool withdraw,
    bytes memory accProof) public;

  function bond(uint256 delegatorId, uint256 validatorId) public;
  function unBond(uint256 delegatorId) public;
  function unbondAll(uint256 validatorId) public;
  function bondAll(uint256 validatorId) public;
  function validatorUnstake(uint256 validatorId) public;
  function updateCommissionRate(uint256 validatorId, uint256 rate) public;

}
