function main()
    x = parse(Int, readline())
    if x < 40
        println(40 - x)
    elseif x < 70
        println(70 - x)
    elseif x < 90
        println(90 - x)
    else
        println("expert")
    end
end

main()
