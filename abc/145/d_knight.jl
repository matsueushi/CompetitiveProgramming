parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

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

function solve(x, y)
    s = x - 2 * y
    t = -2 * x + y
    (s % 3 == 0 && t % 3 == 0) || return 0
    s ÷= -3
    t ÷= -3
    (s < 0 || t < 0) && return 0
    pmc = PrimeModCombination(s + t, P)
    combination(pmc, s + t, s)
end

function main()
    x, y = parseints()
    println(solve(x, y))
end

main()
