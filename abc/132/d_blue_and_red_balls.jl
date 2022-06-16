parseints() = parse.(Int, split(readline()))

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

const P = 10^9 + 7

function solve(n, k)
    pmc = PrimeModCombination(n, P)
    res = zeros(Int, k)
    for i in 1:k
        res[i] = n - k + 1 ≥ i ? (combination(pmc, k - 1, i - 1) * combination(pmc, n - k + 1, i)) % P : 0
    end
    res
end

function main()
    n, k = parseints()
    for x in solve(n, k)
        println(x)
    end
end

main()
