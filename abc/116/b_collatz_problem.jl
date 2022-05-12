function main()
    s = parse(Int, readline())
    used = zeros(Int, 1000000)
    used[s] = 1
    c = 1
    while true
        c += 1
        s = ifelse(iseven(s), s >> 1, 3 * s + 1)
        if used[s] > 0
            println(c)
            return
        else
            used[s] = c
        end
    end
end

main()
