parseint() = parse(Int, readline())

function solve(x)
    a, r = divrem(x, 11)
    if r == 0
        2 * a
    elseif r ≤ 6
        2 * a + 1
    else
        2 * a + 2
    end
end

function main()
    x = parseint()
    println(solve(x))
end

main()
