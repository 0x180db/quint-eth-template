module state {
    import evm.* from "./evm/evm"
    import actors.* from "./actors" 

    type State = {
        vm: Vm,
    }

    pure def return(state: State): State = {
        ...state,
        vm: state.vm.returnAs("idle")
    }

    pure def revert(state: State): State = {
        ...state,
        vm: state.vm.returnAs("revert")
    }

    var state: State

    action init = {
        state' = {
            vm: newVm
        }
    }
}
