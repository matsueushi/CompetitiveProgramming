function solve(n, m, as, bs, cs)
    sort!(as)
    inds = sortperm(cs, rev=true)
    bs = bs[inds]
    cs = cs[inds]

    res = sum(as)
    j = 1
    for i in 1:length(cs)
        b = bs[i]
        while b > 0 && j ≤ n && cs[i] > as[j]
            res += cs[i] - as[j]
            j += 1
            b -= 1
        end
    end
    res
end

function main()
    n, m = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    bs, cs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        bs[i], cs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, as, bs, cs))
end

main()
