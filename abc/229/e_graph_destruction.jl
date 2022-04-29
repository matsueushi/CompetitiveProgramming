using DataStructures

function solve(n, m, as, bs)
    comp = IntDisjointSets(n)
    idx = sortperm(as)
    as = as[idx]
    bs = bs[idx]
    ncs = Int[0]
    nc = 0
    for i in n:-1:2
        nc += 1
        while !isempty(as) && last(as) == i
            a = pop!(as)
            b = pop!(bs)
            in_same_set(comp, a, b) || (nc -= 1)
            union!(comp, a, b)
        end
        push!(ncs, nc)
    end

    for x in reverse(ncs)
        println(x)
    end
end

function main()
    n, m = parse.(Int, split(readline()))
    as, bs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    solve(n, m, as, bs)
end

main()
