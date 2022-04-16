function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    println(length(unique!(as)))
end

main()
