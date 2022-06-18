parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, as, bs)
    g = [Int[] for _ in 1:n]
    eidx = Dict{Pair{Int,Int},Int}()
    for i in 1:n-1
        a, b = as[i], bs[i]
        push!(g[a], b)
        push!(g[b], a)
        eidx[a=>b] = i
        eidx[b=>a] = i
    end
    k = 0
    for i in 1:n
        k = max(k, length(g[i]))
    end

    colors = zeros(Int, n - 1)
    used = falses(n)
    used[1] = true

    stack = [1 => 0]
    while !isempty(stack)
        v, c = pop!(stack)
        uc = 0
        for u in g[v]
            used[u] && continue
            used[u] = true
            uc += 1
            uc == c && (uc += 1)
            colors[eidx[v=>u]] = uc
            push!(stack, u => uc)
        end
    end
    k, colors
end

function main()
    n = parseint()
    as, bs = parsepoints(n - 1)
    k, cs = solve(n, as, bs)
    println(k)
    for c in cs
        println(c)
    end
end

main()
