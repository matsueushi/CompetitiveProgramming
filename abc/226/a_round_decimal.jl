function main()
    x = parse(Float64, readline())
    println(round(Int, x, RoundNearestTiesUp))
end

main()
