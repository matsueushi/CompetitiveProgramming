function main()
    n = parse(Int, readline())
    ds = parse.(Int, split(readline()))
    m = n ÷ 2
    sort!(ds)
    down = ds[m]
    up = ds[m+1]
    println(up - down)
end

main()
