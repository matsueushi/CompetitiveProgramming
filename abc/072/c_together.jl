const N = 10^5

function solve(n, as)
    count = zeros(Int, N)
    for i in 1:n
        for j in -1:1
            1 ≤ as[i] + j || continue
            count[as[i]+j] += 1
        end
    end
    maximum(count)
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve(n, as))
end

main()
