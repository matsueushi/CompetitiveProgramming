using DataStructures

parseints() = parse.(Int, split(readline()))
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

struct Sq
    x::Int
    y::Int
end

const dx = [1, 0, -1, 0]
const dy = [0, 1, 0, -1]

function solve(h, w, a)
    dq = Deque{Sq}()
    dist = fill(typemax(Int) >> 1, h, w)
    for i in 1:h
        for j in 1:w
            if a[i][j] == '#'
                push!(dq, Sq(i, j))
                dist[i, j] = 0
            end
        end
    end
    while !isempty(dq)
        sq = popfirst!(dq)
        for k in 1:4
            x = sq.x + dx[k]
            y = sq.y + dy[k]
            if 1 ≤ x ≤ h && 1 ≤ y ≤ w && a[x][y] == '.' && dist[x, y] > dist[sq.x, sq.y] + 1
                dist[x, y] = dist[sq.x, sq.y] + 1
                push!(dq, Sq(x, y))
            end
        end
    end
    maximum(dist)
end

function main()
    h, w = parseints()
    a = parsestrings(h)
    solve(h, w, a) |> println
end

main()
