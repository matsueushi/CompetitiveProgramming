using DataStructures

function find_longest_length(as, k)
    pq = PriorityQueue{Int64,Int64}()
    l = 1
    mseq = 1
    for (i, a) in enumerate(as)
        if !haskey(pq, a) && length(pq) == k
            x = peek(pq)
            dequeue!(pq)
            l = x.second + 1
        end
        pq[a] = i
        mseq = max(mseq, i - l + 1)
    end
    mseq
end

function main()
    n, k = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    println(find_longest_length(as, k))
end

main()
