function main()
    n, q = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    sort!(as)
    for i in 1:q
        x = parse(Int, readline())
        println(n - searchsortedfirst(as, x) + 1)
    end
end

main()
