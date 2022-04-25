function solve(h, w, c)
    reached = falses(h, w)
    reached[1, 1] = true
    res = 1
    ps = [(1, 1)]
    while !isempty(ps)
        x, y = pop!(ps)
        if x + 1 ≤ h && c[x+1][y] == '.' && !reached[x+1, y]
            reached[x+1, y] = true
            push!(ps, (x + 1, y))
            res = max(res, x + y)
        end
        if y + 1 ≤ w && c[x][y+1] == '.' && !reached[x, y+1]
            reached[x, y+1] = true
            push!(ps, (x, y + 1))
            res = max(res, x + y)
        end
    end
    res
end

function main()
    h, w = parse.(Int, split(readline()))
    c = String[]
    for i in 1:h
        push!(c, readline())
    end
    println(solve(h, w, c))
end

main()
