function divisible(score, k, l, as)
    n = 0
    pos = 0
    for a in as
        if a - pos ≥ score
            pos = a
            n += 1
            n == k && break
        end
    end
    n < k && return false
    l - pos ≥ score
end

function yokan(k, l, as)
    lb, ub = 0, fld(l, k + 1) + 1
    while (ub - lb > 1)
        mid = (lb + ub) ÷ 2
        if divisible(mid, k, l, as)
            lb = mid
        else
            ub = mid
        end
    end
    lb
end

function main()
    n, l = parse.(Int64, split(readline()))
    k = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    println(yokan(k, l, as))
end

main()
