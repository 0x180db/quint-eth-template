module safety {
    import static.* from "./static"

    import state.* from "./state"

    val blockNumberLeMaxBlockNumberInv =
        state.vm.block.number <= maxBlockNumber
}
