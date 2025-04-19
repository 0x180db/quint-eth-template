module oracle {
    import types.* from "./types"

    type Oracle = Address -> int
    
    pure def setPrice(
        oracle: Oracle,
        asset: Address,
        price: int
    ): Oracle = {
       oracle.set(asset, price)
    }
}
