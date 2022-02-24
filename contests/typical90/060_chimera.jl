function lis(n, ys)
    lis = Int64[]
    len = Int64[]
    for i in 1:n
        j = searchsortedfirst(lis, ys[i])
        if j == length(lis) + 1
            push!(lis, ys[i])
        else
            lis[j] = ys[i]
        end
        push!(len, length(lis))
    end
    len
end

function solve(n, xs)
    lis_fwd = lis(n, xs)
    lis_bwd = lis(n, reverse(xs))
    res = 0
    for i in 1:n
        res = max(res, lis_fwd[i] + lis_bwd[n-i+1] - 1)
    end
    res
end

function main()
    n = parse(Int64, readline())
    xs = parse.(Int64, split(readline()))
    println(solve(n, xs))
end

main()
