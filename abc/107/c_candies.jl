parseints() = parse.(Int, split(readline()))

function solve(n, k, xs)
    res = typemax(Int)
    for i in 1:n-k+1
        l = xs[i]
        r = xs[i+k-1]
        if r ≤ 0
            res = min(res, abs(l))
        elseif l ≤ 0
            res = min(res, abs(l) + r + min(abs(l), r))
        else
            res = min(res, r)
        end
    end
    res
end

function main()
    n, k = parseints()
    xs = parseints()
    println(solve(n, k, xs))
end

main()
