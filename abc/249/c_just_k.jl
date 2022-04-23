function solve(n, k, ss)
    xs = [collect(y) .- 'a' .+ 1 for y in ss]
    res = 0
    for i in 1:1<<n-1
        count = zeros(Int, 26)
        for j in 1:n
            if i >> (j - 1) & 1 == 1
                for x in xs[j]
                    count[x] += 1
                end
            end
        end
        res = max(res, sum(count .== k))
    end
    res
end

function main()
    n, k = parse.(Int, split(readline()))
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    println(solve(n, k, ss))
end

main()
