const P = 998244353

function solve(n, s)
    l = n ÷ 2 + (n % 2 == 0 ? 0 : 1)
    m = n ÷ 2 + 1
    ret = 1
    for i in 1:l
        a = s[i] - 'A' + 1
        ret = (ret - 1) * 26 + a
        ret %= P
    end
    if s[l:-1:1] > s[m:end]
        ret += P - 1
        ret %= P
    end
    ret
end

function main()
    t = parse(Int64, readline())
    for i in 1:t
        n = parse(Int64, readline())
        s = readline()
        println(solve(n, s))
    end
end

main()
