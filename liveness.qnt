module liveness {
    import state.* from "./state" 
    
    /** 
     * The key distinction: 
     * - <>(P): P becomes true at least once
     * - []<>(P): P becomes true infinitely often
     * - <>[](P): P eventually becomes true and stays true forever
     * - [](P): P is always true
     *
     * Where:
     * - <> is eventually
     * - [] is always
     */
    temporal progressesOk = always(next(state.vm.pc) != state.vm.pc)
}
