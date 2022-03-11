struct ShareBit
    n::Int64
    d::Int64
    xs::Vector{Int64}
end

function count(sb::ShareBit, i, k, bit)
    if i == sb.n
        return (-1)^k * 1 << (sb.d - count_ones(bit))
    end
    (
        count(sb, i + 1, k + 1, bit | sb.xs[i+1])
        +
        count(sb, i + 1, k, bit)
    )
end

solve(n, d, xs) = count(ShareBit(n, d, xs), 0, 0, 0)

function main()
    n, d = parse.(Int64, split(readline()))
    xs = parse.(Int64, split(readline()))
    println(solve(n, d, xs))
end

main()
