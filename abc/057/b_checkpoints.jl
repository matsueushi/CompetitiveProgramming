function main()
    n, m = parse.(Int, split(readline()))
    as, bs, cs, ds = zeros(Int, n), zeros(Int, n), zeros(Int, m), zeros(Int, m)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    for i in 1:m
        cs[i], ds[i] = parse.(Int, split(readline()))
    end

    res = zeros(Int, n)
    for i in 1:n
        dist = [abs(as[i] - cs[j]) + abs(bs[i] - ds[j]) for j in 1:m]
        res[i] = argmin(dist)
    end
    println(join(res, "\n"))
end

main()
