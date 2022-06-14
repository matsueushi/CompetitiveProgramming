parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, as, bs)
    cs = as .+ bs
    idx = sortperm(cs, rev=true)
    res = 0
    for i in 1:n
        if isodd(i)
            res += as[idx[i]]
        else
            res -= bs[idx[i]]
        end
    end
    res
end

function main()
    n = parseint()
    as, bs = parsepoints(n)
    solve(n, as, bs) |> println
end

main()
