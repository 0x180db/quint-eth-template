module dispatch {
    import static.* from "./static"
    import evm.* from "./evm/evm"
    import evm::calldata.* from "./evm/calldata"

    import state.* from "./state" 

    action dispatch = any {
        // Performs a chain advance action
        // @dev increase current block number to 1, constrain maxBlockNumber to reduce explore states
        all {
            state.vm.block.number < maxBlockNumber,
            state' = {
                ...state,
                vm: state.vm.call(
                    "advanceChain",
                    AdvanceChain(state.vm.block.number + 1)
                )
            }
        }
    }
}
