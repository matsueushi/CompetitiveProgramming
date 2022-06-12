parseint() = parse(Int, readline())

function solve(n)
    iseven(n) && return n, n, n >> 1
    for h in 1:3500
        for j in h:3500
            x = 4 // n - 1 // h
            x < 0 && continue
            x -= 1 // j
            x < 0 && continue
            y = 1 // x
            isinteger(y) && return (h, j, Int(y))
        end
    end
end

function main()
    n = parseint()
    println(join(solve(n), " "))
end

main()
