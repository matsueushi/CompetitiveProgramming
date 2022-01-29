mutable struct RestrictedDigits
    b::Int64
    cs::Vector{Int64}
    res::Vector{Int64}
    table::Matrix{Int64}
end

function RestrictedDigits(b, cs)
    res = zeros(Int64, b)
    for c in cs
        res[1+c%b] += 1
    end
    table = [(10 * bi + c) % b + 1 for bi in 0:b-1, c in cs]
    RestrictedDigits(b, cs, res, table)
end

function shift!(rs::RestrictedDigits)
    m = 10^9 + 7
    nextres = zeros(Int64, rs.b)
    for bi in 1:rs.b
        for ci in 1:length(rs.cs)
            nex = rs.table[bi, ci]
            nextres[nex] += rs.res[bi]
            nextres[nex] = nextres[nex] % m
        end
    end
    rs.res = nextres
end

function rdigits(n, b, cs)
    rs = RestrictedDigits(b, cs)
    for i in 2:n
        shift!(rs)
    end
    first(rs.res)
end

function main()
    n, b, k = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    println(rdigits(n, b, cs))
end

main()
# rdigits(3, 6, [1, 5, 9])
for i in 1:5
    @time rdigits(10^i, 957, [1, 2, 3, 5, 6, 7, 9])
end