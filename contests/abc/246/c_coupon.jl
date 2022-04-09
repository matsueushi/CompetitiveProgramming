function solve(n, k, x, as)
    mk = 0
    rs = Int64[]
    s = 0
    for a in as
        u, v = divrem(a, x)
        mk += u
        s += a
        push!(rs, v)
    end
    if k ≤ mk
        s - k * x
    else
        sort!(rs, rev=true)
        s - mk * x - sum(rs[1:min(n, k - mk)])
    end
end

function main()
    n, k, x = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    println(solve(n, k, x, as))
end

main()
