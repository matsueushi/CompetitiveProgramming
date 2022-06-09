using DataStructures

parseints() = parse.(Int, split(readline()))
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

const dx = [1, 0, -1, 0]
const dy = [0, 1, 0, -1]

function bfs(h, w, ss, s, g)
    sx, sy = s
    dist = fill(typemax(Int), h, w)
    dist[sx, sy] = 1
    dq = Deque{NTuple{2,Int}}()
    push!(dq, s)
    while !isempty(dq)
        x, y = popfirst!(dq)
        (x, y) == g && return dist[x, y]
        for k in 1:4
            i, j = x + dx[k], y + dy[k]
            (1 ≤ i ≤ h && 1 ≤ j ≤ w && ss[i][j] == '.') || continue
            if dist[i, j] > dist[x, y] + 1
                dist[i, j] = dist[x, y] + 1
                push!(dq, (i, j))
            end
        end
    end
    nothing
end

function solve(h, w, ss)
    res = 0
    for i in 1:h
        for j in 1:w
            ss[i][j] == '.' && (res += 1)
        end
    end
    dist = bfs(h, w, ss, (1, 1), (h, w))
    isnothing(dist) && return -1
    res - dist
end

function main()
    h, w = parseints()
    ss = parsestrings(h)
    println(solve(h, w, ss))
end

main()
