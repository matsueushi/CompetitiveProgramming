function solve(n, xs)
    c, r = divrem(sum(xs), 10)
    r == 0 || return false
    ys = repeat(xs, 2)
    s = t = 1
    total = 0
    while true
        while t < 2 * n && total < c
            total += ys[t]
            t += 1
        end
        if total < c
            return false
        elseif total == c
            return true
        else
            total -= ys[s]
            s += 1
        end
    end
end

function main()
    n = parse(Int64, readline())
    xs = parse.(Int64, split(readline()))
    println(solve(n, xs) ? "Yes" : "No")
end

main()
