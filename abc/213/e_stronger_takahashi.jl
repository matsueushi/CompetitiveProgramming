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
    pq = PriorityQueue{Pair{Point,Int},Int}()
    enqueue!(pq, Point(1, 1) => 0, 0)
    while !isempty(pq)
        p, _ = dequeue!(pq)
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
                        enqueue!(pq, Point(x, y) => d, d)
                    end
                else
                    if d + 1 < dist[x, y]
                        dist[x, y] = d + 1
                        enqueue!(pq, Point(x, y) => d + 1, d + 1)
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
