const P = 998244353

struct PrimeModCombination
    n::Int
    p::Int
    fact::Vector{Int}
    fact_inv::Vector{Int}
    iinv::Vector{Int}
end

function PrimeModCombination(n, p)
    fact = zeros(Int, n + 1)
    fact_inv = zeros(Int, n + 1)
    iinv = zeros(Int, n + 1)
    fact[1] = iinv[1] = fact_inv[1] = fact[2] = iinv[2] = fact_inv[2] = 1
    for i in 2:n
        fact[i+1] = fact[i] * i % p
        iinv[i+1] = mod(-fld(p, i) * iinv[p%i+1], p)
        fact_inv[i+1] = fact_inv[i] * iinv[i+1] % p
    end
    PrimeModCombination(n, p, fact, fact_inv, iinv)
end

function combination(pmc::PrimeModCombination, n::Int, k::Int)
    pmc.fact[n+1] * (pmc.fact_inv[k+1] * pmc.fact_inv[n-k+1] % pmc.p) % pmc.p
end

function solve(s)
    pmc = PrimeModCombination(5000, P)

    c = Dict{Char,Int}()
    for x in s
        c[x] = get(c, x, 0) + 1
    end
    n = length(c) + 1
    m = length(s) + 1
    dp = zeros(Int, n, m) # nth char, length m
    dp[1, 1] = 1
    maxlen = 0
    for (i, (k, v)) in enumerate(pairs(c))
        for j in 0:maxlen
            for k in 0:v
                dp[i+1, j+k+1] = (dp[i+1, j+k+1] + dp[i, j+1] * combination(pmc, j + k, k)) % P
            end
        end
        maxlen += v
    end
    (sum(dp[n, :]) - 1) % P
end

function main()
    s = readline()
    println(solve(s))
end

main()
