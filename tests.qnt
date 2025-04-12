module tests {
    import execution.* from "./execution" 

    import evm.* from "./evm/evm"
    import evm::calldata.* from "./evm/calldata"

    import state.* from "./state" 

    run advanceChainTest = 
        init
            .then(all {
                state.vm.block.number == 0,
                state' = {
                    ...state,
                    vm: state.vm.call(
                        "advanceChain",
                        AdvanceChain(1)
                    )
                }
            })
            .then(execution)
            .then(all {
                assert(state.vm.block.number == 1),
                state' = state
            })
}
