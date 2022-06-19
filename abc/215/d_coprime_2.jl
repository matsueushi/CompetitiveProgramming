using Primes

parseints() = parse.(Int, split(readline()))

function solve(n, m, as)
    ps = Set{Int}()
    for a in as
        fs = factor(Dict, a)
        union!(ps, keys(fs))
    end
    ns = trues(m)
    for x in ps
        for k in x:x:m
            ns[k] = false
        end
    end
    res = Int[]
    for i in 1:m
        ns[i] && (push!(res, i))
    end
    res
end

function main()
    n, m = parseints()
    as = parseints()
    res = solve(n, m, as)
    println(length(res))
    for x in res
        println(x)
    end
end

main()
