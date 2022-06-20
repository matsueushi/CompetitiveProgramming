using DataStructures

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(q, ques)
    pq = PriorityQueue{Int,Int}()
    que = Queue{Pair{Int,Int}}()
    for i in 1:q
        t = first(ques[i])
        if t == 1
            enqueue!(que, i => ques[i][2])
        elseif t == 2
            if isempty(pq)
                _, v = dequeue!(que)
                println(v)
            else
                _, v = peek(pq)
                println(v)
                dequeue!(pq)
            end
        else
            while !isempty(que)
                i, v = dequeue!(que)
                enqueue!(pq, i => v)
            end
        end
    end
end

function main()
    q = parseint()
    ques = Vector{Int}[]
    for i in 1:q
        push!(ques, parseints())
    end
    solve(q, ques)
end

main()
