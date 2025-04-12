module utils {
    type Result[a] = { ok: a, err: str }
    
    pure def success(value: a): Result[a] = { 
        ok: value,
        err: "",
    }

    pure def failure(
        value: a,
        reason: str,
    ): Result[a] = { 
        ok: value,
        err: reason,
    }

    pure def isOk(r: Result[a]): bool = r.err == ""
    pure def isErr(r: Result[a]): bool = r.err != ""
    
    pure def probe(n: int): Set[int] =
        Set(0,10,20,40,80,100,110).map(x => n * x / 100)
}
