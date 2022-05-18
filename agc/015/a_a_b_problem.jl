function solve(n, a, b)
    b < a && return 0
    n == 1 && return ifelse(a == b, 1, 0)
    (b - a) * (n - 2) + 1
end

function main()
    n, a, b = parse.(Int, split(readline()))
    println(solve(n, a, b))
end

main()
