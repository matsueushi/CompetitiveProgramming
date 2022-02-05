using DataStructures

function dfs!(edges, i, labels, visited, c)
    visited[i] = true
    for edge in edges[i]
        visited[edge] && continue
        c = dfs!(edges, edge, labels, visited, c)
    end
    c += 1
    labels[c] = i
    c
end

function cbop(n, m, as, bs)
    edges = [Set{Int64}() for _ in 1:n]
    revedges = [Set{Int64}() for _ in 1:n]
    for i in 1:m
        push!(edges[as[i]], bs[i])
        push!(revedges[bs[i]], as[i])
    end

    # first dfs
    visited = falses(n)
    labels = zeros(Int64, n)
    c = 0
    for i in 1:n
        visited[i] && continue
        c = dfs!(edges, i, labels, visited, c)
    end

    # second dfs
    visited = falses(n)
    tmp = zeros(Int64, n)
    ans = 0
    for i in Iterators.reverse(1:n)
        j = labels[i]
        visited[j] && continue
        c = dfs!(revedges, j, tmp, visited, 0)
        ans += c * (c - 1) ÷ 2
    end
    ans
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = zeros(Int64, m)
    bs = zeros(Int64, m)
    for i in 1:m
        as[i], bs[i] = parse.(Int64, split(readline()))
    end
    println(cbop(n, m, as, bs))
end

main()
