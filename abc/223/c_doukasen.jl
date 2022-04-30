function solve(n, as, bs)
    ts = as ./ bs
    tot = sum(ts)
    t = 0
    l = 0
    for i in 1:n
        rt = tot / 2 - t
        if ts[i] ≤ rt
            t += ts[i]
        else
            return l + rt * bs[i]
        end
        l += as[i]
    end
end

function main()
    n = parse(Int, readline())
    as, bs = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, as, bs))
end

main()
