module static {
    pure val eoas = Set("alice", "bob", "chuck")
    pure val contracts = Set()
    pure val actors = Set("zero").union(eoas).union(contracts)
    pure val maxBlockNumber = 3
}
