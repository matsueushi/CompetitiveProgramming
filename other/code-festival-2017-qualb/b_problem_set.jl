parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, ds, m, ts)
    counter = Dict{Int,Int}()
    for i in 1:n
        counter[ds[i]] = get(counter, ds[i], 0) + 1
    end
    for j in 1:m
        get(counter, ts[j], 0) == 0 && return false
        counter[ts[j]] -= 1
    end
    return true
end

function main()
    n = parseint()
    ds = parseints()
    m = parseint()
    ts = parseints()
    println(ifelse(solve(n, ds, m, ts), "YES", "NO"))
end

main()
