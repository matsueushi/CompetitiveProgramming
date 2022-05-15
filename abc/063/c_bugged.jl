function solve(n, ss)
    res = sum(ss)
    res % 10 != 0 && return res
    rems = Int[]
    for i in 1:n
        ss[i] % 10 != 0 && (push!(rems, ss[i]))
    end
    isempty(rems) && return 0
    sort!(rems)
    res - first(rems)
end

function main()
    n = parse(Int, readline())
    ss = zeros(Int, n)
    for i in 1:n
        ss[i] = parse(Int, readline())
    end
    println(solve(n, ss))
end

main()
