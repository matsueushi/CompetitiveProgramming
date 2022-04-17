function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    rs = falses(360)
    rs[1] = true
    r = 0
    for a in as
        r = (r + a) % 360
        rs[r+1] = true
    end
    ts = []
    for i in 0:359
        rs[i+1] && push!(ts, i)
    end
    push!(ts, 360)
    println(maximum(diff(ts)))
end

main()
