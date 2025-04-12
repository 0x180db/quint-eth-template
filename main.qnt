module main {
    import static.* from "./static"
    import dispatch.* from "./dispatch" 
    import execution.* from "./execution" 

    import tests.* from "./tests" 
    import safety.* from "./safety" 
    import liveness.* from "./liveness"

    import evm.* from "./evm/evm"

    import state.* from "./state" 

    action step = any {
        all {
            isIdle(state.vm) or isRevert(state.vm),
            dispatch,
        },
        all {
            not(isIdle(state.vm)) and not(isRevert(state.vm)),
            execution
        }
    }

    /* -------- safety properties ---------- */
    val safetyOk = all {
        blockNumberLeMaxBlockNumberInv
    }

    /* -------- liveness properties ---------- */
    temporal livenessOk = progressesOk 
}
