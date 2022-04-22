using DataStructures

const DX = [1, 1, -1, -1]
const DY = [1, -1, -1, 1]

function solve(n, ax, ay, bx, by, ss)
    deq = Deque{Tuple{Int,Int,Int}}()
    dist = fill(typemax(Int), n, n, 4)
    for i in 1:4
        dist[ax, ay, i] = 1
        push!(deq, (ax, ay, i))
    end
    while !isempty(deq)
        pt = popfirst!(deq)
        pt[1] == bx && pt[2] == by && return dist[pt...]
        for i in 1:4
            x = pt[1] + DX[i]
            y = pt[2] + DY[i]
            (1 ≤ x ≤ n && 1 ≤ y ≤ n && ss[x][y] == '.') || continue
            if pt[3] == i
                if dist[x, y, i] > dist[pt...]
                    dist[x, y, i] = dist[pt...]
                    pushfirst!(deq, (x, y, i))
                end
            else
                if dist[x, y, i] > dist[pt...] + 1
                    dist[x, y, i] = dist[pt...] + 1
                    push!(deq, (x, y, i))
                end
            end
        end
    end
    return -1
end

function main()
    n = parse(Int, readline())
    ax, ay = parse.(Int, split(readline()))
    bx, by = parse.(Int, split(readline()))
    ss = String[]
    for i in 1:n
        push!(ss, readline())
    end
    println(solve(n, ax, ay, bx, by, ss))
end

main()
