const dx = [1, 0, -1, 0]
const dy = [0, -1, 0, 1]

struct Field
    m::Vector{String}
    h::Int64
    w::Int64
    visited::Matrix{Bool}
    sx::Int64
    sy::Int64
end

function rec(fi::Field, i, j, d)
    (1 ≤ i ≤ fi.h && 1 ≤ j ≤ fi.w) || return 0
    (fi.visited[i, j] && fi.sx == i && fi.sy == j) && return d
    (!fi.visited[i, j] && fi.m[i][j] == '.') || return 0
    fi.visited[i, j] = true
    maxd = 0
    for k in 1:4
        maxd = max(maxd, rec(fi, i + dx[k], j + dy[k], d + 1))
    end
    fi.visited[i, j] = false
    maxd
end

function solve(h, w, m)
    maxd = 0
    for i in 1:h
        for j in 1:w
            m[i][j] == '#' && continue
            visited = falses(h, w)
            fi = Field(m, h, w, visited, i, j)
            maxd = max(maxd, rec(fi, i, j, 0))
        end
    end
    maxd < 4 ? -1 : maxd
end

function main()
    h, w = parse.(Int64, split(readline()))
    m = String[]
    for _ in 1:h
        push!(m, readline())
    end
    println(solve(h, w, m))
end

main()
