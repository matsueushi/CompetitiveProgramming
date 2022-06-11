function sieve(n)
    prime = Int[]
    is_prime = trues(n)
    is_prime[1] = false
    for i in 2:n
        if is_prime[i]
            push!(prime, i)
            for j in 2*i:i:n
                is_prime[j] = false
            end
        end
    end
    prime
end

function divisors(n)
    lowers = Int[]
    uppers = Int[]
    i = 1
    isqrtn = isqrt(n)
    for i in 1:isqrtn
        if n % i == 0
            push!(lowers, i)
            if i != n ÷ i
                push!(uppers, n ÷ i)
            end
        end
    end
    vcat(lowers, reverse(uppers))
end
