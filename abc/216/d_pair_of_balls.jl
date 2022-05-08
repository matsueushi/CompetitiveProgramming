function solve(n, m, ks, a)
    locs = ones(Int, m)
    used = falses(n)

    stack = Int[]
    for i in 1:m
        push!(stack, a[i][1])
    end

    depth = [Pair{Int,Int}[] for _ in 1:n]
    for i in 1:m
        for k in 1:ks[i]
            push!(depth[a[i][k]], i => k)
        end
    end

    count = 0
    while !isempty(stack)
        x = pop!(stack)
        used[x] && continue
        (c1, d1), (c2, d2) = depth[x]
        if locs[c1] == d1 && locs[c2] == d2
            count += 1
            used[x] = true
            locs[c1] += 1
            locs[c2] += 1
            d1 != ks[c1] && (push!(stack, a[c1][d1+1]))
            d2 != ks[c2] && (push!(stack, a[c2][d2+1]))
        end
    end
    count == n
end

function main()
    n, m = parse.(Int, split(readline()))
    ks = zeros(Int, m)
    a = Vector{Int}[]
    for i in 1:m
        ks[i] = parse(Int, readline())
        push!(a, parse.(Int, split(readline())))
    end
    println(solve(n, m, ks, a) ? "Yes" : "No")
end

main()
