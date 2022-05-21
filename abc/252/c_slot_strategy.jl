parseint() = parse(Int, readline())

function solve(n, ss)
    pos = zeros(Int, n, 10)
    for i in 1:n
        for j in 1:10
            x = parse(Int, ss[i][j])
            pos[i, x+1] = j
        end
    end

    res = typemax(Int)
    for k in 1:10
        ts = fill(-1, 10)
        for i in 1:n
            p = pos[i, k]
            if ts[p] < 0
                ts[p] = p - 1
            else
                ts[p] += 10
            end
        end
        res = min(res, maximum(ts))
    end
    res
end

function main()
    n = parseint()
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    println(solve(n, ss))
end

main()
