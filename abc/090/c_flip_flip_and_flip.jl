function solve(n, m)
    n == m == 1 && return 1
    n == 1 && return m - 2
    m == 1 && return n - 2
    n * m - 2 * (n - 2) - 2 * (m - 2) - 4
end

function main()
    n, m = parse.(Int, split(readline()))
    println(solve(n, m))
end

main()
