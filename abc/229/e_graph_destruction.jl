using DataStructures

function solve(n, m, as, bs)
    comp = IntDisjointSets(n)
    pq = PriorityQueue{Pair{Int},Int}(Base.Order.Reverse)
    for i in 1:m
        enqueue!(pq, as[i] => bs[i], as[i])
    end
    ncs = Int[0]
    nc = 0
    for i in n:-1:2
        nc += 1
        while !isempty(pq) && last(peek(pq)) == i
            edge, _ = dequeue_pair!(pq)
            in_same_set(comp, first(edge), last(edge)) || (nc -= 1)
            union!(comp, first(edge), last(edge))
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
