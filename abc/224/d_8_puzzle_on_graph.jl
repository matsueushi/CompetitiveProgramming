using DataStructures

function solve(m, us, vs, ps)
    graph = [Int[] for _ in 1:9]
    for i in 1:m
        push!(graph[us[i]], vs[i])
        push!(graph[vs[i]], us[i])
    end

    p = fill(9, 9)
    for i in 1:8
        p[ps[i]] = i
    end

    q = Queue{Vector{Int}}()
    d = Dict{Vector{Int},Int}()
    enqueue!(q, p)
    d[p] = 0
    while !isempty(q)
        p = dequeue!(q)
        sp = -1
        for i in 1:9
            p[i] == 9 && (sp = i; break)
        end
        for v in graph[sp]
            p2 = copy(p)
            p2[v], p2[sp] = p2[sp], p2[v]
            haskey(d, p2) && continue
            d[p2] = d[p] + 1
            enqueue!(q, p2)
        end
    end

    ans = collect(1:9)
    get(d, ans, -1)
end

function main()
    m = parse(Int, readline())
    us, vs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        us[i], vs[i] = parse.(Int, split(readline()))
    end
    ps = parse.(Int, split(readline()))
    println(solve(m, us, vs, ps))
end

main()
