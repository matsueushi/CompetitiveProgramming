using DataStructures

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(q, qs)
    offset = 0
    pq = PriorityQueue{Pair{Int,Int},Int}()
    res = Int[]
    for i in 1:q
        if qs[i][1] == 1
            v = qs[i][2] - offset
            enqueue!(pq, i => v, v)
        elseif qs[i][1] == 2
            offset += qs[i][2]
        else
            _, v = dequeue!(pq)
            push!(res, v + offset)
        end
    end
    res
end

function main()
    q = parseint()
    qs = Vector{Int}[]
    for i in 1:q
        push!(qs, parseints())
    end
    res = solve(q, qs)
    for x in res
        println(x)
    end
end

main()
