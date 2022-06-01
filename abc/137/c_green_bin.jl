parseint() = parse(Int, readline())

function solve(n, ss)
    ct = Dict{String,Int}()
    for i in 1:n
        s = join(sort(collect(ss[i])))
        ct[s] = get(ct, s, 0) + 1
    end
    res = 0
    for v in values(ct)
        res += binomial(v, 2)
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
