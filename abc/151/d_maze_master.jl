using DataStructures

parseints() = parse.(Int, split(readline()))

const dx = [1, 0, -1, 0]
const dy = [0, 1, 0, -1]

function maze(h, w, ss, i, j)
    d = fill(typemax(Int), h, w)
    que = Queue{NTuple{2,Int}}()
    enqueue!(que, (i, j))
    d[i, j] = 0
    res = 0
    while !isempty(que)
        (i0, j0) = dequeue!(que)
        for k in 1:4
            i1, j1 = i0 + dx[k], j0 + dy[k]
            if (1 ≤ i1 ≤ h && 1 ≤ j1 ≤ w && ss[i1][j1] == '.' && d[i1, j1] == typemax(Int))
                enqueue!(que, (i1, j1))
                d[i1, j1] = d[i0, j0] + 1
                res = max(res, d[i1, j1])
            end
        end
    end
    res
end

function solve(h, w, ss)
    res = 0
    for i in 1:h
        for j in 1:w
            if ss[i][j] == '.'
                res = max(res, maze(h, w, ss, i, j))
            end
        end
    end
    res
end

function main()
    h, w = parseints()
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    println(solve(h, w, ss))
end

main()
