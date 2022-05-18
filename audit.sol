# Palkeoramix decompiler. 

const unknown048a1a9d = 100 * 10^18
const decimals = 18
const unknown51e546b2 = 500 * 10^18
const WAIT_TIME = 1800

def storage:
  owner is addr at storage 0
  balanceOf is mapping of uint256 at storage 1
  allowance is mapping of uint256 at storage 2
  totalSupply is uint256 at storage 3
  stor4 is array of struct at storage 4
  stor5 is array of struct at storage 5
  unknown844b829a is mapping of uint256 at storage 6

def totalSupply() payable: 
  return totalSupply

def balanceOf(address _owner) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _owner == _owner
  return balanceOf[addr(_owner)]

def unknown844b829a(uint256 _param1) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _param1 == addr(_param1)
  return unknown844b829a[_param1]

def owner() payable: 
  return owner

def allowance(address _owner, address _spender) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _owner == _owner
  require _spender == _spender
  return allowance[addr(_owner)][addr(_spender)]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def renounceOwnership() payable: 
  if owner != caller:
      revert with 0, 'Razzor: caller is not the owner'
  owner = 0
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _newOwner == _newOwner
  if owner != caller:
      revert with 0, 'Razzor: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: new owner is the zero address'
  owner = _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)

def approve(address _spender, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _value == _value
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve to the zero address'
  allowance[caller][addr(_spender)] = _value
  log Approval(
        address tokenOwner=_value,
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def Mint(address _to, uint256 _amount) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _to == _to
  require _amount == _amount
  if owner != caller:
      revert with 0, 'Razzor: caller is not the owner'
  if not _to:
      revert with 0, 'Razzor: Minting to Zero Address'
  if totalSupply > -_amount - 1:
      revert with 'NH{q', 17
  totalSupply += _amount
  if balanceOf[addr(_to)] > -_amount - 1:
      revert with 'NH{q', 17
  balanceOf[addr(_to)] += _amount
  log Transfer(
        address from=_amount,
        address to=0,
        uint256 tokens=_to)

def faucet() payable: 
  if balanceOf[caller] > 500 * 10^18:
      revert with 0, 'Razzor: Don't be greedy!'
  if unknown844b829a[caller] > -1801:
      revert with 'NH{q', 17
  if block.timestamp < unknown844b829a[caller] + 1800:
      revert with 0, 'Come Back after 30 minutes'
  unknown844b829a[caller] = block.timestamp
  if not caller:
      revert with 0, 'Razzor: mint to the zero address'
  if totalSupply > 0xfffffffffffffffffffffffffffffffffffffffffffffffa9438a1d29cefffff:
      revert with 'NH{q', 17
  totalSupply += 100 * 10^18
  if balanceOf[caller] > 0xfffffffffffffffffffffffffffffffffffffffffffffffa9438a1d29cefffff:
      revert with 'NH{q', 17
  balanceOf[caller] += 100 * 10^18
  log Transfer(
        address from=100 * 10^18,
        address to=0,
        uint256 tokens=caller)

def increaseAllowance(address _spender, uint256 _addedValue) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _addedValue == _addedValue
  if allowance[caller][addr(_spender)] > -_addedValue - 1:
      revert with 'NH{q', 17
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve to the zero address'
  allowance[caller][addr(_spender)] += _addedValue
  log Approval(
        address tokenOwner=(allowance[caller][addr(_spender)] + _addedValue),
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def transfer(address _to, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _to == _to
  require _value == _value
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer from the zero address'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer to the zero address'
  if balanceOf[caller] < _value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds balance'
  balanceOf[caller] -= _value
  if balanceOf[addr(_to)] > -_value - 1:
      revert with 'NH{q', 17
  balanceOf[addr(_to)] += _value
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 tokens=_to)
  return 1

def decreaseAllowance(address _spender, uint256 _subtractedValue) payable: 
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  require _subtractedValue == _subtractedValue
  if allowance[caller][addr(_spender)] < _subtractedValue:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: decreased allowance below zero'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve to the zero address'
  allowance[caller][addr(_spender)] -= _subtractedValue
  log Approval(
        address tokenOwner=(allowance[caller][addr(_spender)] - _subtractedValue),
        address spender=caller,
        uint256 tokens=_spender)
  return 1

def unknownf2fe868c(uint256 _param1) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _param1 == addr(_param1)
  if owner != caller:
      revert with 0, 'Razzor: caller is not the owner'
  if not this.address:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer from the zero address'
  if not addr(_param1):
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer to the zero address'
  if balanceOf[addr(this.address)] < balanceOf[addr(this.address)]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds balance'
  balanceOf[addr(this.address)] = 0
  if balanceOf[addr(_param1)] > -balanceOf[addr(this.address)] - 1:
      revert with 'NH{q', 17
  balanceOf[addr(_param1)] += balanceOf[addr(this.address)]
  log Transfer(
        address from=balanceOf[addr(this.address)],
        address to=this.address,
        uint256 tokens=addr(_param1))

def transferFrom(address _from, address _to, uint256 _value) payable: 
  require calldata.size - 4 >=ΓÇ▓ 96
  require _from == _from
  require _to == _to
  require _value == _value
  if _to != this.address:
      if not _from:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer from the zero address'
      if not _to:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer to the zero address'
      if balanceOf[addr(_from)] < _value:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds balance'
      balanceOf[addr(_from)] -= _value
      if balanceOf[addr(_to)] > -_value - 1:
          revert with 'NH{q', 17
      balanceOf[addr(_to)] += _value
      log Transfer(
            address from=_value,
            address to=_from,
            uint256 tokens=_to)
      if allowance[addr(_from)][caller] < _value:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds allowance'
      if not _from:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve from the zero address'
      if not caller:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve to the zero address'
      allowance[addr(_from)][caller] -= _value
      log Approval(
            address tokenOwner=(allowance[addr(_from)][caller] - _value),
            address spender=_from,
            uint256 tokens=caller)
  else:
      if balanceOf[addr(_from)] < _value:
          revert with 0, 'Not enough balance'
      if not _from:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer from the zero address'
      if not _to:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer to the zero address'
      if balanceOf[addr(_from)] < balanceOf[addr(_from)]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds balance'
      balanceOf[addr(_from)] = 0
      if balanceOf[addr(_to)] > -balanceOf[addr(_from)] - 1:
          revert with 'NH{q', 17
      balanceOf[addr(_to)] += balanceOf[addr(_from)]
      log Transfer(
            address from=balanceOf[addr(_from)],
            address to=_from,
            uint256 tokens=_to)
      if allowance[addr(_from)][addr(_to)] < _value:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: transfer amount exceeds allowance'
      if not _from:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve from the zero address'
      if not caller:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Razzor: approve to the zero address'
      allowance[addr(_from)][caller] = allowance[addr(_from)][addr(_to)] - _value
      log Approval(
            address tokenOwner=(allowance[addr(_from)][addr(_to)] - _value),
            address spender=_from,
            uint256 tokens=caller)
  return 1

def name() payable: 
  if bool(stor4.length):
      if bool(stor4.length) == stor4.length.field_1 < 32:
          revert with 'NH{q', 34
      if bool(stor4.length):
          if bool(stor4.length) == stor4.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor4.length.field_1:
              if 31 < stor4.length.field_1:
                  mem[128] = uint256(stor4.field_0)
                  idx = 128
                  s = 0
                  while stor4.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor4[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)])
              mem[128] = 256 * stor4.length.field_8
      else:
          if bool(stor4.length) == stor4.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor4.length.field_1:
              if 31 < stor4.length.field_1:
                  mem[128] = uint256(stor4.field_0)
                  idx = 128
                  s = 0
                  while stor4.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor4[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)])
              mem[128] = 256 * stor4.length.field_8
      mem[ceil32(stor4.length.field_1) + 192 len ceil32(stor4.length.field_1)] = mem[128 len ceil32(stor4.length.field_1)]
      if ceil32(stor4.length.field_1) > stor4.length.field_1:
          mem[ceil32(stor4.length.field_1) + stor4.length.field_1 + 192] = 0
      return Array(len=2 * Mask(256, -1, stor4.length.field_1), data=mem[128 len ceil32(stor4.length.field_1)], mem[(2 * ceil32(stor4.length.field_1)) + 192 len 2 * ceil32(stor4.length.field_1)]), 
  if bool(stor4.length) == stor4.length.field_1 < 32:
      revert with 'NH{q', 34
  if bool(stor4.length):
      if bool(stor4.length) == stor4.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor4.length.field_1:
          if 31 < stor4.length.field_1:
              mem[128] = uint256(stor4.field_0)
              idx = 128
              s = 0
              while stor4.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor4[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)])
          mem[128] = 256 * stor4.length.field_8
  else:
      if bool(stor4.length) == stor4.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor4.length.field_1:
          if 31 < stor4.length.field_1:
              mem[128] = uint256(stor4.field_0)
              idx = 128
              s = 0
              while stor4.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor4[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)])
          mem[128] = 256 * stor4.length.field_8
  mem[ceil32(stor4.length.field_1) + 192 len ceil32(stor4.length.field_1)] = mem[128 len ceil32(stor4.length.field_1)]
  if ceil32(stor4.length.field_1) > stor4.length.field_1:
      mem[ceil32(stor4.length.field_1) + stor4.length.field_1 + 192] = 0
  return Array(len=stor4.length % 128, data=mem[128 len ceil32(stor4.length.field_1)], mem[(2 * ceil32(stor4.length.field_1)) + 192 len 2 * ceil32(stor4.length.field_1)]), 

def symbol() payable: 
  if bool(stor5.length):
      if bool(stor5.length) == stor5.length.field_1 < 32:
          revert with 'NH{q', 34
      if bool(stor5.length):
          if bool(stor5.length) == stor5.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor5.length.field_1:
              if 31 < stor5.length.field_1:
                  mem[128] = uint256(stor5.field_0)
                  idx = 128
                  s = 0
                  while stor5.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor5[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)])
              mem[128] = 256 * stor5.length.field_8
      else:
          if bool(stor5.length) == stor5.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor5.length.field_1:
              if 31 < stor5.length.field_1:
                  mem[128] = uint256(stor5.field_0)
                  idx = 128
                  s = 0
                  while stor5.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor5[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)])
              mem[128] = 256 * stor5.length.field_8
      mem[ceil32(stor5.length.field_1) + 192 len ceil32(stor5.length.field_1)] = mem[128 len ceil32(stor5.length.field_1)]
      if ceil32(stor5.length.field_1) > stor5.length.field_1:
          mem[ceil32(stor5.length.field_1) + stor5.length.field_1 + 192] = 0
      return Array(len=2 * Mask(256, -1, stor5.length.field_1), data=mem[128 len ceil32(stor5.length.field_1)], mem[(2 * ceil32(stor5.length.field_1)) + 192 len 2 * ceil32(stor5.length.field_1)]), 
  if bool(stor5.length) == stor5.length.field_1 < 32:
      revert with 'NH{q', 34
  if bool(stor5.length):
      if bool(stor5.length) == stor5.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor5.length.field_1:
          if 31 < stor5.length.field_1:
              mem[128] = uint256(stor5.field_0)
              idx = 128
              s = 0
              while stor5.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor5[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)])
          mem[128] = 256 * stor5.length.field_8
  else:
      if bool(stor5.length) == stor5.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor5.length.field_1:
          if 31 < stor5.length.field_1:
              mem[128] = uint256(stor5.field_0)
              idx = 128
              s = 0
              while stor5.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor5[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)])
          mem[128] = 256 * stor5.length.field_8
  mem[ceil32(stor5.length.field_1) + 192 len ceil32(stor5.length.field_1)] = mem[128 len ceil32(stor5.length.field_1)]
  if ceil32(stor5.length.field_1) > stor5.length.field_1:
      mem[ceil32(stor5.length.field_1) + stor5.length.field_1 + 192] = 0
  return Array(len=stor5.length % 128, data=mem[128 len ceil32(stor5.length.field_1)], mem[(2 * ceil32(stor5.length.field_1)) + 192 len 2 * ceil32(stor5.length.field_1)]), 


