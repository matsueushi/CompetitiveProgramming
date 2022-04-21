function main()
    n = parse(Int, readline())
    hs = parse.(Int, split(readline()))
    h = 0
    for i in 1:n
        hs[i] ≤ h && break
        h = hs[i]
    end
    println(h)
end

main()
