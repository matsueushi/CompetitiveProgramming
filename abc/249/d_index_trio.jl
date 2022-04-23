const M = 2 * 10^5

function solve(n, as)
    count = zeros(Int, M)
    for a in as
        count[a] += 1
    end
    sort!(as)
    unique!(as)
    amax = last(as)
    res = 0

    aimax = isqrt(amax)
    nn = length(as)
    for i in 1:nn
        as[i] > aimax && break
        ajmax = amax ÷ as[i]
        for j in i:nn
            as[j] > ajmax && break
            f = searchsorted(as, as[i] * as[j])
            isempty(f) && continue
            k = only(f)
            res0 = count[as[i]] * count[as[j]] * count[as[k]]
            if i == j
                res += res0
            else
                res += 2 * res0
            end
        end
    end
    res
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve(n, as))
end

main()

# println((i, j, k, as[i], as[j], as[k], res0))