parseints() = parse.(Int, split(readline()))

function solve(n, m, ss, xs)
    ts = zeros(Int, n)
    ts[1] = 0
    for i in 1:n-1
        ts[i+1] = -ts[i] + ss[i]
    end

    cdict = Dict{Int,Int}()
    for i in 1:m
        for j in 1:n
            alpha = (-1)^(j + 1) * (xs[i] - ts[j])
            cdict[alpha] = get(cdict, alpha, 0) + 1
        end
    end

    res = 0
    for v in values(cdict)
        res = max(res, v)
    end
    res
end

function main()
    n, m = parseints()
    ss = parseints()
    xs = parseints()
    println(solve(n, m, ss, xs))
end

main()
