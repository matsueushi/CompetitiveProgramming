parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

function solve(n, m)
    if n > m
        n, m = m, n
    end
    n < m - 1 && return 0
    res = 1
    for i in 1:m
        res = (res * i) % P
    end
    for j in 1:n
        res = (res * j) % P
    end
    if n == m
        res = (2 * res) % P
    end
    res
end

function main()
    n, m = parseints()
    println(solve(n, m))
end

main()
