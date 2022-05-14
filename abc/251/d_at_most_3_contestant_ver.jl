function solve()
    wts = collect(1:99)
    for i in 100:100:9900
        push!(wts, i)
    end
    for i in 10000:10000:1000000
        push!(wts, i)
    end
    wts
end

function main()
    w = parse(Int, readline())
    wts = solve()
    println(length(wts))
    println(join(wts, " "))
end

main()