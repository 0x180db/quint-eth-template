module math {
    pure val e3 = 10^3   // kwei
    pure val e4 = 10^4   // basis points
    pure val e6 = 10^6   // mwei
    pure val e9 = 10^9   // gwei
    pure val e12 = 10^12 // szabo
    pure val e15 = 10^15 // finney
    pure val e18 = 10^18 // ether
    pure val e27 = 10^27 // ray

    pure def kwei(n: int): int = n * e3
    pure def bp(n: int): int = n * e4
    pure def mwei(n: int): int = n * e6
    pure def gwei(n: int): int = n * e9
    pure def szabo(n: int): int = n * e12
    pure def finney(n: int): int = n * e15
    pure def ether(n: int): int = n * e18
    pure def ray(n: int): int = n * e27
   
    pure def max(a: int, b: int): int =
        if (a > b) a else b

    pure def min(a: int, b: int): int =
        if (a < b) a else b
    
    pure def abs(a: int): int =
        if (a < 0) -a else a
    
    pure def ceil(a: int, b: int): int =
        a + b - 1 / b 

    pure def sqrt(n: int): int =
      if (n <= 0) 0
      else
        val initialGuess = max(1, n / 2)
        1.to(10).fold(
          initialGuess,
          (guess, _) => (guess + n / guess) / 2
        )

    pure def scaleMul(a: int, b: int, f: int): int = {
        val h = f / 2
        ((a * b) + h) / f
    } 

    pure def scaleDiv(a: int, b: int, f: int): int = {
        val h = b / 2
        ((a * f) + h) / b
    } 
}
