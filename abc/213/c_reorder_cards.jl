parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(h, w, n, as, bs)
    sas = sort(collect(Set(as)))
    sbs = sort(collect(Set(bs)))
    cs, ds = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        cs[i] = searchsortedfirst(sas, as[i])
        ds[i] = searchsortedfirst(sbs, bs[i])
    end
    cs, ds
end

function main()
    h, w, n = parseints()
    as, bs = parsepoints(n)
    cs, ds = solve(h, w, n, as, bs)
    for (c, d) in zip(cs, ds)
        println("$c $d")
    end
end

main()
