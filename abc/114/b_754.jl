function main()
    s = parse.(Int, readline())
    ans = typemax(Int)
    while true
        ans = min(ans, abs(753 - s % 1000))
        s < 1000 && break
        s ÷= 10
    end
    println(ans)
end

main()
