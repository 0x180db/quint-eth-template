module execution {
    import utils.* from "./std/utils"
    
    import evm.* from "./evm/evm"
    import evm::calldata.* from "./evm/calldata"

    import state.* from "./state" 

    action execution: bool = any {
        all {
            state.vm.pc == "advanceChain",
            {
                val nextBlockNumber = state.vm.calldata.unwrapAdvanceChain()
                val result = advanceChain(nextBlockNumber)
                state' = result.ok.return()
            }
        },
    }

    def advanceChain(nextValue: int): Result[State] =
        success({
            ...state,
            vm: state.vm.roll(nextValue)
        })
}
