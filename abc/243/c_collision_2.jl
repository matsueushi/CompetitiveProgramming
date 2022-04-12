function solve(n, xs, ys, s)
    ls = Dict{Int64,Int64}()
    rs = Dict{Int64,Int64}()
    for i in 1:n
        x, y = xs[i], ys[i]
        if s[i] == 'L'
            (haskey(rs, y) && rs[y] ≤ x) && return true
            if haskey(ls, y)
                ls[y] = max(ls[y], x)
            else
                ls[y] = x
            end
        else
            (haskey(ls, y) && ls[y] ≥ x) && return true
            if haskey(rs, y)
                rs[y] = min(rs[y], x)
            else
                rs[y] = x
            end
        end
    end
    return false
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zero(xs)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    s = readline()
    println(solve(n, xs, ys, s) ? "Yes" : "No")
end

main()
