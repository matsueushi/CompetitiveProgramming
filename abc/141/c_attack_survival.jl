function solve(n, k, q, as)
    count = zeros(Int, n)
    for i in 1:q
        count[as[i]] += 1
    end
    @. k - q + count > 0
end

function main()
    n, k, q = parse.(Int, split(readline()))
    as = zeros(Int, q)
    for i in 1:q
        as[i] = parse(Int, readline())
    end
    win = solve(n, k, q, as)
    for i in 1:n
        println(win[i] ? "Yes" : "No")
    end
end

main()
