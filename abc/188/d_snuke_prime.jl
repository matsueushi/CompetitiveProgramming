parseints() = parse.(Int, split(readline()))

function solve(n, c, as, bs, cs)
    xs = vcat(as, bs .+ 1) |> unique |> sort
    coff = zeros(Int, length(xs))
    for i in 1:n
        aind = searchsortedfirst(xs, as[i])
        bind = searchsortedfirst(xs, bs[i] + 1)
        coff[aind] += cs[i]
        coff[bind] -= cs[i]
    end
    costs = cumsum(coff)
    res = 0
    for i in 1:length(xs)-1
        res += min(c, costs[i]) * (xs[i+1] - xs[i])
    end
    res
end

function main()
    n, c = parseints()
    as, bs, cs = zeros(Int, n), zeros(Int, n), zeros(Int, n)
    for i in 1:n
        as[i], bs[i], cs[i] = parseints()
    end
    solve(n, c, as, bs, cs) |> println
end

main()
