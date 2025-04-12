module ownership {
    type Ownership = int -> str
    
    pure def newOwnership(
        items: Set[int]
    ): Ownership = {
        items.mapBy(id => "zero")
    }

    pure def assignOwner(
        ownership: Ownership,
        itemId: int,
        newOnwer: str    
    ): int -> str = {
        ownership.set(itemId, newOnwer)
    }
}
