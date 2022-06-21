using DataStructures

parseints() = parse.(Int, split(readline()))
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

struct Point
    x::Int
    y::Int
end

function solve(h, w, ss)
    dist = fill(typemax(Int), h, w)
    dist[1, 1] = 0
    dq = Deque{Pair{Point,Int}}()
    push!(dq, Point(1, 1) => 0)
    while !isempty(dq)
        p, d = popfirst!(dq)
        for dx in -2:2
            for dy in -2:2
                (dx == dy == 0 || abs(dx) == abs(dy) == 2) && continue
                x = p.x + dx
                y = p.y + dy
                (1 ≤ x ≤ h && 1 ≤ y ≤ w) || continue
                d = dist[p.x, p.y]
                if abs(dx) + abs(dy) == 1 && ss[x][y] == '.'
                    if d < dist[x, y]
                        dist[x, y] = d
                        pushfirst!(dq, Point(x, y) => d)
                    end
                else
                    if d + 1 < dist[x, y]
                        dist[x, y] = d + 1
                        push!(dq, Point(x, y) => d + 1)
                    end
                end
            end
        end
    end
    dist[h, w]
end

function main()
    h, w = parseints()
    ss = parsestrings(h)
    solve(h, w, ss) |> println
end

main()
