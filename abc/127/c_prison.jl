function solve(n, m, ls, rs)
    l, r = 1, n
    for i in 1:m
        l = max(l, ls[i])
        r = min(r, rs[i])
    end
    max(r - l + 1, 0)
end

function main()
    n, m = parse.(Int, split(readline()))
    ls, rs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        ls[i], rs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, ls, rs))
end

main()
