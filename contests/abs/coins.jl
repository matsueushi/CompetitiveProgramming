function main()
    ma = parse(Int64, readline())
    mb = parse(Int64, readline())
    mc = parse(Int64, readline())
    x = parse(Int64, readline())
    cnt = 0
    a_l = max(0, cld(x - 100 * mb - 50 * mc, 500))
    a_u = min(ma, x ÷ 500)
    for a in a_l:a_u
        b_l = max(0, cld(x - 500 * a - 50 * mc, 100))
        b_u = min(mb, (x - 500 * a) ÷ 100)
        cnt += b_u - b_l + 1
    end
    println(cnt)
end

main()