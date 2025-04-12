module balance {
    import types.* from "./types"

    type Balance = Address -> int

    pure def newBalance(
        addresses: Set[Address]
    ): Balance = {
        addresses.mapBy(addr => 0)
    }

    pure def balanceOf(
        balance: Balance,
        addr: Address,
    ): int = {
        balance.get(addr)
    }

    pure def mint(
        balance: Balance,
        recipient: Address,
        amount: int
    ): Address -> int = {
        balance
            .setBy(recipient, (current) => current + amount)
    }

    pure def burn(
        balance: Balance,
        recipient: Address,
        amount: int
    ): Address -> int = {
        balance
            .setBy(recipient, (current) => current - amount)
    }

    pure def transfer(
        balance: Balance,
        sender: Address,
        recipient: Address,
        amount: int
    ): Address -> int = {
        balance
            .setBy(sender, (current) => current - amount)
            .setBy(recipient, (current) => current + amount)
    }
    
    pure def totalSupply(
        balance: Balance,
    ): int = {
        balance.keys().fold(0, (acc, addr) => acc + balance.get(addr))
    }

    pure def noNegativeBalance(balance: Balance): bool = {
        balance.keys().forall(addr => {
            balance.get(addr) >= 0
        })
    }
}
