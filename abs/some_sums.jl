function main()
    n, a, b = parse.(Int64, split(readline()))
    ans = 0
    for x in 1:n
        y = x
        dsum = 0
        while (y > 0)
            y, r = divrem(y, 10)
            dsum += r
        end
        a ≤ dsum && dsum ≤ b && (ans += x)
    end
    println(ans)
end

main()