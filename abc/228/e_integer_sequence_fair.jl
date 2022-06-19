parseints() = parse.(Int, split(readline()))

const P = 998244353

function solve(n, k, m)
    m % P == 0 && return 0
    b = powermod(k, n, P - 1)
    powermod(m, b, P)
end

function main()
    n, k, m = parseints()
    solve(n, k, m) |> println
end

main()
