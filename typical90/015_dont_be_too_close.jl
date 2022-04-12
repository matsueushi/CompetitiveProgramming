function factorial_table(n, p)
    fac = zeros(Int64, n) # k!
    kinv = zeros(Int64, n) #k^{-1}
    finv = zeros(Int64, n) #(k!)^{-1}
    fac[1] = 1
    kinv[1] = 1
    finv[1] = 1
    for k in 2:n
        fac[k] = fac[k-1] * k % p
        kinv[k] = p - kinv[p%k] * (p ÷ k) % p
        finv[k] = finv[k-1] * kinv[k] % p
    end
    fac, finv
end

function dont_be_too_close(n, p)
    fac, finv = factorial_table(n, p)
    ans = zeros(Int64, n)
    for k in 1:n
        fk = 0
        for m in 1:fld(n - 1, k)+1
            a = n - (k - 1) * (m - 1)
            a == m && (fk = (fk + 1) % p; continue)
            # aCm mod p
            fkm = fac[a] * finv[a-m] % p
            fkm = fkm * finv[m] % p
            fk = (fk + fkm) % p
        end
        ans[k] = fk
    end
    ans
end

function main()
    n = parse(Int64, readline())
    p = 10^9 + 7
    println(join(dont_be_too_close(n, p), "\n"))
end

main()
