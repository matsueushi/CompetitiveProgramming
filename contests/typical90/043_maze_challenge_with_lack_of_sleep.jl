using DataStructures

function solve(h, w, grid, rs, cs, rt, ct)
    grid, rs, cs, rt, ct
    dx = [-1, 0, 1, 0]
    dy = [0, 1, 0, -1]
    ds = fill(typemax(Int64), h, w, 4)
    dq = Deque{Tuple{Int64,Int64,Int64}}()
    for i in 1:4
        push!(dq, (rs, cs, i))
        ds[rs, cs, i] = 0
    end
    while !isempty(dq)
        p = pop!(dq)
        dp = ds[p...]
        px, py, di = p
        for i in 1:4
            if dp + 1 < ds[px, py, i]
                ds[px, py, i] = dp + 1
                pushfirst!(dq, (px, py, i))
            end
        end
        x = px + dx[di]
        y = py + dy[di]
        if x ≥ 1 && y ≥ 1 && x ≤ h && y ≤ w && iszero(grid[x, y]) && dp < ds[x, y, di]
            ds[x, y, di] = dp
            push!(dq, (x, y, di))
        end
    end
    minimum(ds[rt, ct, :])
end


function main()
    h, w = parse.(Int64, split(readline()))
    rs, cs = parse.(Int64, split(readline()))
    rt, ct = parse.(Int64, split(readline()))
    grid = zeros(Int64, (h, w))
    for i in 1:h
        s = readline()
        s = replace(s, '.' => '0')
        s = replace(s, '#' => '1')
        grid[i, :] = parse.(Int64, split(s, ""))
    end
    println(solve(h, w, grid, rs, cs, rt, ct))
end

main()