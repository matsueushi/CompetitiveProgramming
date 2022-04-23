
function solve(n, k, as)
    cas = vcat([0], cumsum(as))
    smap = Dict{Int,Int}()
    res = 0
    for i in 1:n
        smap[cas[i]] = get(smap, cas[i], 0) + 1
        res += get(smap, cas[i+1] - k, 0)
    end
    res
end

function main()
    n, k = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, k, as))
end

main()
