const P = 998244353

function main()
    n = parse(Int, readline())
    table = zeros(Int, 18)
    for i in 1:18
        k = 9 * 10^(i - 1) % P
        m = (k * (k + 1) ÷ 2) % P
        table[i] = m
    end
    exponent = 0
    while true
        exponent += 1
        10^exponent > n && break
    end
    res = sum(table[1:(exponent-1)]) % P
    remain = (n - 10^(exponent - 1) + 1) % P
    res += remain * (remain + 1) ÷ 2
    res %= P
    println(res)
end

main()
