parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function dfs!(graph, ls, rs, f, t, ind)
    c = 0
    l = typemax(Int)
    r = -typemax(Int)
    for u in graph[t]
        u == f && continue
        c += 1
        ind = dfs!(graph, ls, rs, t, u, ind)
        l = min(l, ls[u])
        r = max(r, rs[u])
    end
    if c == 0
        ind += 1
        ls[t] = ind
        rs[t] = ind
    else
        ls[t] = l
        rs[t] = r
    end
    ind
end

function solve(n, us, vs)
    graph = [Int[] for _ in 1:n]
    for (u, v) in zip(us, vs)
        push!(graph[u], v)
        push!(graph[v], u)
    end
    ls, rs = zeros(Int, n), zeros(Int, n)
    dfs!(graph, ls, rs, -1, 1, 0)
    ls, rs
end

function main()
    n = parseint()
    us, vs = parsepoints(n - 1)
    ls, rs = solve(n, us, vs)
    for (l, r) in zip(ls, rs)
        println("$l $r")
    end
end

main()
