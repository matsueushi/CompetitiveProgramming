function solve(n, k, as)
    j = 1
    s = first(as)
    res = 0
    for i in 1:n
        while s < k && j < n
            s += as[j+1]
            j += 1
        end
        s ≥ k && (res += n - j + 1)
        s -= as[i]
    end
    res
end

function main()
    n, k = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, k, as))
end

main()
