function solve(n, q, ls, rs)
    graph = [Int[] for _ in 1:n+1]
    for i in 1:q
        push!(graph[ls[i]], rs[i] + 1)
        push!(graph[rs[i]+1], ls[i])
    end
    reached = falses(n + 1)
    vs = [1]
    while !isempty(vs)
        v = pop!(vs)
        reached[v] && continue
        reached[v] = true
        for nv in graph[v]
            push!(vs, nv)
        end
    end
    reached[n+1]
end

function main()
    n, q = parse.(Int, split(readline()))
    ls, rs = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        ls[i], rs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, q, ls, rs) ? "Yes" : "No")
end

main()
