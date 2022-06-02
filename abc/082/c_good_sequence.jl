parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    d = Dict{Int,Int}()
    for a in as
        d[a] = get(d, a, 0) + 1
    end
    res = 0
    for (k, v) in pairs(d)
        if v > k
            res += v - k
        elseif v < k
            res += v
        end
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
