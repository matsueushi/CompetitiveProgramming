function solve(n, d, ls, rs)
    idx = sortperm(rs)
    rs = rs[idx]
    ls = ls[idx]
    punch = 0
    right = -1
    for i in 1:n
        right ≥ ls[i] && continue
        punch += 1
        right = rs[i] + d - 1
    end
    punch
end

function main()
    n, d = parse.(Int, split(readline()))
    ls = zeros(Int, n)
    rs = zero(ls)
    for i in 1:n
        ls[i], rs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, d, ls, rs))
end

main()
