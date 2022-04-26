function solve(n, w, as, bs)
    idx = sortperm(as, rev=true)
    as = as[idx]
    bs = bs[idx]
    used = 0
    taste = 0
    for i in 1:n
        c = min(bs[i], w - used)
        used += c
        taste += as[i] * c
        used == w && return taste
    end
    taste
end

function main()
    n, w = parse.(Int, split(readline()))
    as = zeros(Int, n)
    bs = zero(as)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, w, as, bs))
end

main()
