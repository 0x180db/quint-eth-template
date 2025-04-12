module evm::calldata {
    type Calldata = 
        | None
        | AdvanceChain(int)

    // @param block The block number.  
    pure def unwrapAdvanceChain(calldata: Calldata) int = {
            match calldata {
                | AdvanceChain(data) => data
                | _ => 0
            }
    }
}
