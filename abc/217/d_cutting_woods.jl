using DataStructures

function solve(l, q, cs, xs)
    cuts = SortedSet{Int}([0, l])
    for i in 1:q
        if cs[i] == 1
            push!(cuts, xs[i])
        else
            ind = searchsortedfirst(cuts, xs[i])
            println(deref((cuts, ind)) - deref((cuts, regress((cuts, ind)))))
        end
    end
end

function main()
    l, q = parse.(Int, split(readline()))
    cs, xs = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        cs[i], xs[i] = parse.(Int, split(readline()))
    end
    solve(l, q, cs, xs)
end

main()
