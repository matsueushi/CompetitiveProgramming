function abs_rating(as, b)
    b ≤ first(as) && return first(as) - b
    b ≥ last(as) && return b - last(as)
    lb, ub = 1, length(as)
    while (ub - lb > 1)
        mid = (lb + ub) ÷ 2
        if b < as[mid]
            ub = mid
        else
            lb = mid
        end
    end
    min(abs(b - as[lb]), abs(b - as[ub]))
end

function cp_classes(as, bs)
    sort!(as)
    [abs_rating(as, b) for b in bs]
end

function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    q = parse(Int64, readline())
    lines = readlines()
    bs = parse.(Int64, lines[1:q])
    println.(cp_classes(as, bs))
end

main()
