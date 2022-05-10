module CombinationModule

"""
fact[i] = (i-1)! mod p
fact_inv[i] = ((i-1)!)^{-1} mod p
iinv = (i-1)^{-1} mod P (i > 0)

p = a * i + b, 0 ≤ b < i
-> a * i = -b mod p
-> i^{-1} = -b * a^{-1} 
"""

export PrimeModCombination, combination

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

end