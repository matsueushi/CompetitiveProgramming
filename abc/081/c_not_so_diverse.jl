parseints() = parse.(Int, split(readline()))

function solve(n, k, as)
    counter = Dict{Int,Int}()
    for i in 1:n
        a = as[i]
        counter[a] = get(counter, a, 0) + 1
    end
    xs = NTuple{2,Int}[]
    for (k, v) in pairs(counter)
        push!(xs, (v, k))
    end
    sort!(xs)
    res = 0
    for i in 1:length(xs)-k
        res += first(xs[i])
    end
    res
end

function main()
    n, k = parseints()
    as = parseints()
    println(solve(n, k, as))
end

main()
