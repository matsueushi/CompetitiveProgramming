using DataStructures

const dx = [1, 0, -1, 0]
const dy = [0, 1, 0, -1]

Point = NTuple{2,Int}

mutable struct Rink
    h::Int
    w::Int
    n::Int
    pos::Dict{Point,Int}
    dr::Vector{Int}
end

Rink(h::Int, w::Int) = Rink(h, w, 0, Dict(), Int[])

function add_pos!(r::Rink, p::Point)
    if 1 ≤ p[1] ≤ r.h && 1 ≤ p[2] ≤ r.w && !haskey(r.pos, p)
        r.n += 1
        r.pos[p] = r.n
        push!(r.dr, 0)
    end
end

function set_direction!(r::Rink, p::Point, d::Int)
    if 1 ≤ p[1] ≤ r.h && 1 ≤ p[2] ≤ r.w
        r.dr[r.pos[p]] |= 1 << (d - 1)
    end
end

stoppable(r::Rink, p::Point, d::Int) = r.dr[r.pos[p]] >> (d - 1) & 1 == 1

function traces(r::Rink, pos::Vector{Point}, i::Int, d::Int)
    vps = NTuple{2,Point}[]
    k = 1
    qs = Point[]
    for p in pos
        k != p[i] && (k = p[i]; empty!(qs); push!(qs, p); continue)
        stoppable(r, p, d) || (push!(qs, p); continue)
        for q in qs
            push!(vps, (q, p))
        end
        empty!(qs)
    end
    vps
end

function solve(h, w, n, sx, sy, gx, gy, xs, ys)
    rink = Rink(h, w)
    sp = (sx, sy)
    gp = (gx, gy)
    add_pos!(rink, sp)
    add_pos!(rink, gp)
    for i in 1:n
        for j in 1:4
            p = (xs[i] + dx[j], ys[i] + dy[j])
            add_pos!(rink, p)
            set_direction!(rink, p, j)
        end
    end

    pos = collect(keys(rink.pos))

    nnode = length(pos)
    graph = [Int[] for _ in 1:nnode]

    sort!(pos)
    for (q, p) in traces(rink, pos, 1, 4)
        push!(graph[rink.pos[q]], rink.pos[p])
    end

    sort!(pos, by=x -> (x[1], -x[2]))
    for (q, p) in traces(rink, pos, 1, 2)
        push!(graph[rink.pos[q]], rink.pos[p])
    end

    sort!(pos, by=x -> (x[2], x[1]))
    for (q, p) in traces(rink, pos, 2, 3)
        push!(graph[rink.pos[q]], rink.pos[p])
    end

    sort!(pos, by=x -> (x[2], -x[1]))
    for (q, p) in traces(rink, pos, 2, 1)
        push!(graph[rink.pos[q]], rink.pos[p])
    end

    # 01-bfs
    dq = Deque{Int}()
    dist = fill(typemax(Int), nnode)
    dist[rink.pos[sp]] = 0
    push!(dq, rink.pos[sp])
    gpos = rink.pos[gp]
    while !isempty(dq)
        i = popfirst!(dq)
        i == gpos && return dist[gpos]
        for j in graph[i]
            if dist[j] > dist[i] + 1
                dist[j] = dist[i] + 1
                push!(dq, j)
            end
        end
    end
    -1
end

function main()
    h, w, n = parse.(Int, split(readline()))
    sx, sy = parse.(Int, split(readline()))
    gx, gy = parse.(Int, split(readline()))
    xs = zeros(Int, n)
    ys = zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    println(solve(h, w, n, sx, sy, gx, gy, xs, ys))
end

main()