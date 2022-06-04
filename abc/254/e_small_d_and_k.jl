using DataStructures

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, as, bs, q, xs, ks)
    g = [Int[] for i in 1:n]
    for i in 1:m
        a, b = as[i], bs[i]
        push!(g[a], b)
        push!(g[b], a)
    end
    res = zeros(Int, q)
    used = falses(n)
    for i in 1:q
        fill!(used, false)
        que = Queue{Pair{Int,Int}}()
        enqueue!(que, xs[i] => 0)
        r = 0
        while !isempty(que)
            (x, d) = dequeue!(que)
            used[x] && continue
            used[x] = true
            r += x
            d == ks[i] && continue
            for v in g[x]
                enqueue!(que, v => d + 1)
            end
        end
        res[i] = r
    end
    res
end

function main()
    n, m = parseints()
    as, bs = parsepoints(m)
    q = parseint()
    xs, ks = parsepoints(q)
    res = solve(n, m, as, bs, q, xs, ks)
    for x in res
        println(x)
    end
end

main()
