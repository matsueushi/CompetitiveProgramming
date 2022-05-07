function solve(n, xs, ys)
    ypoints = Dict{Int,Vector{Int}}()
    intervals = Dict{Pair{Int,Int},Int}()
    for i in 1:n
        x, y = xs[i], ys[i]
        yps = get!(ypoints, x, Int[])
        for y1 in yps
            u, v = minmax(y, y1)
            intervals[u=>v] = get(intervals, u => v, 0) + 1
        end
        push!(yps, y)
    end
    res = 0
    for c in values(intervals)
        res += c * (c - 1) ÷ 2
    end
    res
end

function main()
    n = parse(Int, readline())
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
