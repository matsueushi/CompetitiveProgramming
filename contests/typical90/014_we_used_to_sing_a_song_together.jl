function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    println(sum(abs.(sort!(as) .- sort!(bs))))
end

main()
