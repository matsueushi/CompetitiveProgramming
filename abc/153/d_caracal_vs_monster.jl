function solve(h)
    h == 1 && return 1
    2 * solve(h ÷ 2) + 1
end

function main()
    h = parse(Int, readline())
    println(solve(h))
end

main()
