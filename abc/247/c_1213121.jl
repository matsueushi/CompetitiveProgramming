function solve(n)
    n == 1 && return "1"
    s = solve(n - 1)
    "$s $n $s"
end

function main()
    n = parse(Int64, readline())
    println(solve(n))
end

main()
