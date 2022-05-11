function main()
    n = parse(Int, readline())
    xs = parse.(Int, split(readline()))
    xsum = sum(xs)
    up = cld(xsum, n)
    down = fld(xsum, n)
    ans = typemax(Int)
    for p in (up, down)
        ans = min(ans, sum((xs .- p) .^ 2))
    end
    println(ans)
end

main()
