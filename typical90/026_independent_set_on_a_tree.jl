function color(tree, flags, i, idx)
    flags[i] = idx
    for j in tree[i]
        flags[j] == 0 && color(tree, flags, j, idx + 1)
    end
    flags
end

function indep_tree(n, as, bs)
    tree = [Vector{Int64}() for _ in 1:n]
    for (a, b) in zip(as, bs)
        push!(tree[a], b)
        push!(tree[b], a)
    end
    nodecolor = color(tree, zeros(Int64, n), 1, 1)
    oddnode = findall(isodd, nodecolor)
    evennode = findall(iseven, nodecolor)
    length(oddnode) ≥ length(evennode) ? oddnode[1:n÷2] : evennode[1:n÷2]
end

function main()
    n = parse(Int64, readline())
    as = zeros(Int64, n - 1)
    bs = zeros(Int64, n - 1)
    for i in 1:n-1
        as[i], bs[i] = parse.(Int64, split(readline()))
    end
    nodes = indep_tree(n, as, bs)
    println(join(nodes, " "))
end

main()
