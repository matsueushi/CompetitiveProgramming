using Primes

function k_factors(n, k)
    nfac = zeros(Int64, n)
    ps = primes(n)
    for p in ps
        for i in p:p:n
            nfac[i] += 1
        end
    end
    count(≥(k), nfac)
end

function main()
    n, k = parse.(Int64, split(readline()))
    println(k_factors(n, k))
end

main()
