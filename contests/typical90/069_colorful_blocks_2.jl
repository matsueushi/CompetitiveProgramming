const P = 10^9 + 7

function solve(n, k)
    n == 1 && return k
    n == 2 && return k * (k - 1) % P
    (k * (k - 1) % P) * powermod(k - 2, n - 2, P) % P
end

function main()
    n, k = parse.(Int64, split(readline()))
    println(solve(n, k))
    # println(solve(10^18,10^9))
end

main()
