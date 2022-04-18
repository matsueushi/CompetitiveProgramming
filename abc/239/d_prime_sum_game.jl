using Primes

function main()
    a, b, c, d = parse.(Int, split(readline()))
    for i in a:b
        found = false
        for j in c:d
            found |= isprime(i + j)
        end
        found || (println("Takahashi"); return)
    end
    println("Aoki")
end

main()
