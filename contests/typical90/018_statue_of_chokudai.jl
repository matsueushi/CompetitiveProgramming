function artula(t, l, x, y, q, es)
    rads = @. 2.0 * π * es / t
    eys = @. -0.5 * l * sin(rads)
    ezs = @. 0.5 * l * (1.0 - cos(rads))
    distxy = @. sqrt(x^2 + (eys - y)^2)
    @. atand(ezs, distxy)
end

function main()
    t = parse(Int64, readline())
    l, x, y = parse.(Int64, split(readline()))
    q = parse(Int64, readline())
    es = zeros(Int64, q)
    for i in 1:q
        es[i] = parse(Int64, readline())
    end
    println(join(artula(t, l, x, y, q, es), "\n"))
end

main()
