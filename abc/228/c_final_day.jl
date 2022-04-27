function solve(n, k, p)
    sp = vec(sum(p, dims=2))
    score = sort(sp, rev=true)[k]
    for i in 1:n
        println(sp[i] ≥ score - 300 ? "Yes" : "No")
    end
end

function main()
    n, k = parse.(Int, split(readline()))
    p = zeros(Int, n, 3)
    for i in 1:n
        p[i, :] = parse.(Int, split(readline()))
    end
    solve(n, k, p)
end

main()
