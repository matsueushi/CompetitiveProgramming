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

const sv = sieve(200000)

function main()
    x = parse.(Int, readline())
    println(sv[searchsortedfirst(sv, x)])
end

main()
