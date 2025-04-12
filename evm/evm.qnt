module evm {
    import evm::calldata.* from "./calldata"
    import evm::event.* from "./event"

    type Block = {
        number: int,
        timestamp: int
    }

    type Vm = {
        pc: str,
        calldata: Calldata,
        event: Event,
        block: Block
    }

    pure def newVm: Vm = {
        pc: "idle",
        calldata: None,
        event: Empty,
        block: {
            number: 0,
            timestamp: 0
        }
    }

    pure def setPc(vm: Vm, pc: str): Vm = {
        ...vm,
        pc: pc
    }

    pure def setCalldata(vm: Vm, calldata: Calldata): Vm = {
        ...vm,
        calldata: calldata
    }

    pure def setEvent(vm: Vm, event: Event): Vm = {
        ...vm,
        event: event
    }

    pure def call(
        vm: Vm,
        pc: str,
        calldata: Calldata,
    ): Vm = {
        vm
            .setPc(pc)
            .setCalldata(calldata)
            .setEvent(Empty)
    }

    pure def emit(
        vm: Vm,
        event: Event
    ): Vm =
        vm.setEvent(event)

    pure def roll(vm: Vm, value: int): Vm = {
        ...vm,
        block: {
            ...vm.block,
            number: value 
        }
    }

    pure def returnAs(
        vm: Vm,
        status: str
    ): Vm = {
        ...vm,
        pc: status,
    }

    pure def isIdle(vm: Vm): bool =
        vm.pc == "idle"

    pure def isRevert(vm: Vm): bool =
        vm.pc == "revert"
}

