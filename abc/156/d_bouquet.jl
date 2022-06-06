parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7
const Q = 2 * 10^5

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

function solve(n, a, b)
    res = powermod(2, n, P) - 1
    pmc = PrimeModCombination(Q, P)
    for v in [a, b]
        r1 = 1
        for i in n:-1:n-v+1
            r1 = (r1 * i) % P
        end
        r1 = (r1 * pmc.fact_inv[v+1]) % P
        res -= r1
    end
    mod(res, P)
end

function main()
    n, a, b = parseints()
    println(solve(n, a, b))
end

main()
