'''
How to compile/run:

1.) Install magic: https://docs.modular.com/magic/
2.) Compile (This will install Mojo when run first time):
    magic run mojo build -o main main.mojo  
3.) Run: 
    ./main 

'''

alias N = 440_000_000

fn is_munchausen(number: Int, cache: List[Int]) -> Bool:
    var n = number
    var total:Int = 0

    while n > 0:
        var digit:Int = n % 10
        total += cache[digit]
        if total > number:
            return False
        n //= 10

    return total == number

def get_cache() -> List[Int]:
    var ca = List[Int](capacity=10)
    ca[0] = 0
    for i in range(1,10):
        ca[i] = i**i
    return ca

def main() -> None:
    var cache = get_cache()
    for n in range(0, N):
        if is_munchausen(n, cache):
            print(n)


